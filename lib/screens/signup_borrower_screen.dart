import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation/mixins/alerts_mixin.dart';
import 'package:graduation/models/city.dart';
import 'package:graduation/models/http_exception.dart';
import 'package:graduation/providers/auth.dart';
import 'package:graduation/providers/global_data.dart';
import 'package:graduation/providers/location_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../widgets/add_photo_widget.dart';
import 'map_screen.dart';

class SignUpBorrower extends StatefulWidget {
  static final String routeName = "/sign-up-borrower";

  @override
  _SignUpBorrowerState createState() => _SignUpBorrowerState();
}

class _SignUpBorrowerState extends State<SignUpBorrower> with AlertsMixin {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  Map<String, dynamic> _authData = {
    'fullname': '',
    'username': '',
    'email': '',
    'longitude': '',
    'latitude': '',
    'phoneNumber': '',
    'password': '',
    'confirmPassword': '',
    'roleId': 1
  };
  var _governVal;

  ImagePicker _imagePicker = ImagePicker();
  bool isLoading = false;
  var locationButtonTxt = 'Location';
  PermissionStatus _permissionGranted;
  LatLng _pickedLocation;
  var currentLocData;
  Location location = new Location();
  String locationText = '';
  bool _serviceEnabled;

  File _pickedImage;
  Future<void> selectLocationOnMap(BuildContext context) async {
    isLoading = true;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        setState(() {
          isLoading = false;
        });
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error !'),
                content: Text('Location is disabled , try again later'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.DENIED) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.GRANTED) {
        setState(() {
          isLoading = false;
        });
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error !'),
                content: Text('Permission denied, try again later'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        return;
      }
    }

    currentLocData = await Location().getLocation();

    _pickedLocation = await Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(
              initialLocationLat: currentLocData.latitude,
              initialLocationLng: currentLocData.longitude,
              isSelecting: true,
            )));
    if (_pickedLocation != null) {
      locationButtonTxt = await Provider.of<LocationInfo>(context,
              listen: false)
          .getPlaceAddress(_pickedLocation.latitude, _pickedLocation.longitude);
      if (locationButtonTxt == null) {
        setState(() {
          locationButtonTxt = 'Location';
          isLoading = false;
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Error !'),
                  content: Text('No internet connection , try again later'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        });
      } else {
        locationText = locationButtonTxt;
      }
      _authData['latitude'] = _pickedLocation.latitude?.toString();
      _authData['longitude'] = _pickedLocation.longitude?.toString();
    }
    isLoading = false;
  }

  bool isUploading = false;

  Future<PickedFile> _getImageFromCamera() async {
    PickedFile image = await _imagePicker.getImage(
        source: ImageSource.camera, maxWidth: 600, imageQuality: 90);
    return image;
  }

  Future<void> _uploadImage(String filePath) async {
    setState(() {
      isUploading = true;
    });
    try {
      final response = await _authReference.uploadFile(filePath);
      _authData['profilePictureId'] = json.decode(response)['imageId'];
    } on HttpException catch (e) {
      print(e);
    } catch (e) {
      rethrow;
    }
    setState(() {
      isUploading = false;
    });
  }

  Future<PickedFile> _getImageFromGallery() async {
    PickedFile image = await _imagePicker.getImage(
        source: ImageSource.gallery, maxWidth: 600, imageQuality: 90);
    return image;
  }

  _openPickingOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(25.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              onPressed: () async {
                Navigator.pop(context);
                PickedFile myFile = await _getImageFromCamera();
                _pickedImage = File(myFile.path);
                _uploadImage(myFile.path);
                setState(() {});
              },
              icon: Icon(
                Icons.camera_alt,
                color: Theme.of(context).buttonColor,
              ),
              iconSize: 28.0,
              tooltip: 'Camera',
            ),
            IconButton(
              onPressed: () async {
                Navigator.pop(context);
                PickedFile myFile = await _getImageFromGallery();
                _pickedImage = File(myFile.path);
                _uploadImage(myFile.path);
                setState(() {});
              },
              icon: Icon(
                Icons.photo_library,
                color: Theme.of(context).buttonColor,
              ),
              iconSize: 28.0,
              tooltip: 'Gallery',
            )
          ],
        ),
      ),
      elevation: 0,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(26.0), topLeft: Radius.circular(26.0)),
      ),
    );
  }

  bool _isLoading = false;

  Map args;

  Future<void> _register() async {
    if (_formKey.currentState.validate()) {
      if (false) {
      }
//      if (_pickedimage == null) {
//        showDialog(
//            context: context,
//            builder: (BuildContext context) {
//              return AlertDialog(
//                title: Text('Missing Data'),
//                content: Text('Please choose your profile picture !'),
//                actions: <Widget>[
//                  FlatButton(
//                    child: Text('Ok'),
//                    onPressed: () {
//                      Navigator.of(context).pop();
//                    },
//                  )
//                ],
//              );
//            });
//      }
      else {
        _formKey.currentState.save();
        setState(() {
          _isLoading = true;
        });
        try {
          await _authReference.register(_authData);
          Navigator.of(context).pop(true);
//          final parsedRegResponse = json.decode(regResponse);
//          print(parsedRegResponse);
//          Navigator.of(context).pushNamedAndRemoveUntil(
//              MainScreen.routeName, (route) => false);
        } on HttpException catch (error) {
          showErrorDialog(
              context, error.toString(), Duration(milliseconds: 1500));
        } catch (error) {
          throw error;
        }
        _isLoading = false;
        setState(() {});
      }
    }
  }

  GlobalData _globalDataReference;
  Auth _authReference;

  @override
  void didChangeDependencies() {
    _globalDataReference = Provider.of<GlobalData>(context, listen: false);
    args = ModalRoute.of(context).settings.arguments ?? {};
    _authData['roleId'] = args['roleId'];
    _authReference = Provider.of<Auth>(context, listen: false);
    if (_globalDataReference.cities == null ||
        _globalDataReference.cities.length == 0) {
      _getCities();
    }
    super.didChangeDependencies();
  }

  Future<void> _getCities() async {
    try {
      await _globalDataReference.fetchCities();
    } on HttpException catch (e) {
      showErrorDialog(context, e.toString());
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            ClipPath(
                              clipper: WaveClipper2(),
                              child: Container(
                                child: Column(),
                                width: double.infinity,
                                height: 180,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  Color(0x44ffe29e),
                                  Color(0x44ffe29e)
                                ])),
                              ),
                            ),
                            ClipPath(
                              clipper: WaveClipper3(),
                              child: Container(
                                child: Column(),
                                width: double.infinity,
                                height: 180,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  Color(0x99fbe197),
                                  Color(0x99ffe29e)
                                ])),
                              ),
                            ),
                            ClipPath(
                              clipper: WaveClipper1(),
                              child: Container(
                                child: Column(
                                  children: <Widget>[],
                                ),
                                width: double.infinity,
                                height: 180,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  Color(0xfffbc02d),
                                  Color(0xfffac02e)
                                ])),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                            borderRadius: BorderRadius.circular(75.0),
                            onTap: _openPickingOptions,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                AddPhotoAvatar(
                                  image: _pickedImage,
                                ),
                                if (isUploading)
                                  Container(
                                    width: 150.0,
                                    height: 150.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(75.0),
                                        color: Colors.black45.withOpacity(0.5)),
                                    child: SizedBox(
                                      width: 30.0,
                                      height: 30.0,
                                      child: Platform.isIOS
                                          ? CupertinoActivityIndicator()
                                          : CircularProgressIndicator(),
                                    ),
                                  )
                              ],
                            )),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter your name';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _authData['username'] = value;
                                _authData['fullname'] = value;
                              },
                              decoration: InputDecoration(
                                  labelText: "Username",
                                  labelStyle: TextStyle(color: Colors.blueGrey),
                                  prefixIcon: Material(
                                    elevation: 0,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 10)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty || !value.contains('@')) {
                                  return 'Invalid email!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _authData['email'] = value;
                              },
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyle(color: Colors.blueGrey),
                                  prefixIcon: Material(
                                    elevation: 0,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 10)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: TextFormField(
                              controller: _passwordController,
                              validator: (value) {
                                if (value.isEmpty || value.length < 5) {
                                  return 'Password is too short!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _authData['password'] = value;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: Colors.blueGrey),
                                  prefixIcon: Material(
                                    elevation: 0,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 10)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: TextFormField(
                              validator: (value) {
                                if (value != _passwordController.text) {
                                  return 'Passwords do not match!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _authData['confirmPassword'] = value;
                              },
                              obscureText: true,
                              cursorColor: Colors.deepOrange,
                              decoration: InputDecoration(
                                  labelText: "Confirm Password",
                                  labelStyle: TextStyle(color: Colors.blueGrey),
                                  prefixIcon: Material(
                                    elevation: 0,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 10)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: TextFormField(
                              validator: (value) {
                                if (value.length != 11) {
                                  return 'Invalid Phone Number';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _authData['phoneNumber'] = value;
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: "Mobile",
                                  labelStyle: TextStyle(color: Colors.blueGrey),
                                  prefixIcon: Material(
                                    elevation: 0,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 10)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Selector<GlobalData, List<City>>(
                              selector: (_, globalData) => globalData.cities,
                              builder: (_, cities, __) =>
                                  DropdownButtonFormField(
                                validator: (val) {
                                  if (val == null) {
                                    return 'Choose Your Governorate';
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  _authData['governmentId'] = val;
                                },
                                onChanged: (val) {
                                  setState(() {
                                    _governVal = val;
                                    print(_governVal);
                                  });
                                },
                                value: _governVal,
                                decoration: InputDecoration(
                                    labelText: "Governorate",
                                    labelStyle:
                                        TextStyle(color: Colors.blueGrey),
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 1)),
                                items: cities.map((val) {
                                  return DropdownMenuItem(
                                    child: Text(val.name),
                                    value: val.id,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        if (args['roleId'] == 2)
                          Consumer<LocationInfo>(
                            builder: (ctx, locationInfo, _) {
                              return isLoading == true
                                  ? CircularProgressIndicator()
                                  : InkWell(
                                      onTap: () {
                                        selectLocationOnMap(context);
                                        setState(() {});
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 32),
                                        child: Material(
                                          elevation: 2.0,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          child: TextFormField(
                                            enabled: false,
                                            onSaved: (value) {
                                              if (_pickedLocation != null) {
                                                _authData['latitude'] =
                                                    _pickedLocation.latitude;
                                                _authData['longitude'] =
                                                    _pickedLocation.longitude;
                                              }
                                            },
                                            decoration: InputDecoration(
                                                labelText: locationButtonTxt,
                                                labelStyle: TextStyle(
                                                    color: Colors.blueGrey),
                                                prefixIcon: Material(
                                                  elevation: 0,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30)),
                                                ),
                                                border: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 25,
                                                        vertical: 10)),
                                          ),
                                        ),
                                      ),
                                    );
                            },
                          ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: _isLoading
                      ? SizedBox(
                          height: 50.0,
                          child: Center(
                            child: Platform.isIOS
                                ? CupertinoActivityIndicator()
                                : CircularProgressIndicator(),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              color: Color(0xfffac02e)),
                          child: FlatButton(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            onPressed: _register,
                          ),
                        )),
            ],
          )),
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
