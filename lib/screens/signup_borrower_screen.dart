import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation/mixin/alerts_mixin.dart';
import 'package:graduation/models/city.dart';
import 'package:graduation/providers/auth.dart';
import 'package:graduation/providers/global_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../widgets/add_photo_widget.dart';

class SignUpBorrower extends StatefulWidget {
  static final String routeName = "/sign-up-borrower";

  @override
  _SignUpBorrowerState createState() => _SignUpBorrowerState();
}

class _SignUpBorrowerState extends State<SignUpBorrower> with AlertsMixin {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  Map<String, dynamic> _authData = {
    'fullname' : '',
    'username': '',
    'email': '',
    'phoneNumber': '',
    'password': '',
    'confirmPassword' : '',
    'roleId' : 1
  };
  var _goverval;
  File _pickedimage;

  Future<void> _takephoto() async {
    _pickedimage = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 600,
      maxWidth: 600,
    );
    if (_pickedimage != null) {
      setState(() {
        _authData['profilephoto'] = _pickedimage;
      });
    }
  }
  bool _isLoading = false;

  Future<void> _register() async {
    if (_formKey.currentState.validate()) {
      if(false) {

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

              await Provider.of<Auth>(context, listen: false).register(_authData);
//          final parsedRegResponse = json.decode(regResponse);
//          print(parsedRegResponse);
//          Navigator.of(context).pushNamedAndRemoveUntil(
//              MainScreen.routeName, (route) => false);
          _isLoading = false;
        } on HttpException catch (error) {
          _isLoading = false;
          showErrorDialog(
              context, error.toString(), Duration(milliseconds: 1500));
        } catch (error) {
          _isLoading = false;
          throw error;
        }
        setState(() {});
      }
    }
  }

  GlobalData _globalDataReference;

  @override
  void didChangeDependencies() {
    _globalDataReference = Provider.of<GlobalData>(context, listen: false);
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
                            onTap: _takephoto,
                            child: AddPhotoAvatar(
                              image: _pickedimage,
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
                                  labelText: "User Name",
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
                              builder: (_, cities, __) =>  DropdownButtonFormField(
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
                                    _goverval = val;
                                    print(_goverval);
                                  });
                                },
                                value: _goverval,
                                decoration: InputDecoration(
                                    labelText: "Governorate",
                                    labelStyle: TextStyle(color: Colors.blueGrey),
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
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
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
