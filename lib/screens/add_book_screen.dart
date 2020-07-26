import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/mixins/alerts_mixin.dart';
import 'package:graduation/models/category.dart';
import 'package:graduation/providers/auth.dart';
import 'package:graduation/providers/books.dart';
import 'package:graduation/providers/global_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as p;
import '../widgets/add_book_button_widget.dart';
import '../widgets/add_photo_widget.dart';

///todo
///// شوف هتعمل ايه فى كود submit

///  Variables To Adding Book ////
const String _bookTitle = 'Book Title';
const String _authorName = 'Author Name';
const String _noOfCopies = 'Number Of Copies';
const String _bookImage = 'Image Of The Book';
const String _libName = 'Library Name';
const String _bookCategory = 'Book Category';

Map<String, dynamic> _uploadData = {
  'title': '',
  'author': '',
  'description': '',
  'copiesCount': '',
  'coverPhotoId': '',
  'categoryId': 1,
  'rating': 4,
  'statusId' : 2
};

///*****************************************************///

class AddBookScreen extends StatefulWidget {
  static const routeName = '/add-book-library';
  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> with AlertsMixin {
  final _formKey = GlobalKey<FormState>();
  var _categoryValue;

  /// Getting Image From The User  In 2 Ways Gallery or Taking Photo
  File _image;
//  Future getImageFromCamera() async {
//    var image = await ImagePicker.pickImage(source: ImageSource.camera);
//    setState(() {
//      _image = image;
//      _addBookData[_bookImage] = _image;
//    });
//  }



//  Future getImageFromDevice() async {
//    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//    setState(() {
//      _image = image;
//      _addBookData[_bookImage] = _image;
//    });
//  }


  bool _isLoading = false;

  Future<void> _submit() async{
    if (_formKey.currentState.validate()) {
//      if (_image == null) {
//        showDialog(
//            context: context,
//            builder: (BuildContext context) {
//              return AlertDialog(
//                title: Text('Missing Data'),
//                content: Text('it is prefered to upload an image'),
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
        _formKey.currentState.save();
        setState(() {
          _isLoading = true;
        });
        try {
          !_isUpdate ? await _booksReference.uploadBook(json.encode(_uploadData))
          : await _booksReference.updateBook(_updateData);
          Navigator.of(context).pop();
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
        finally {
          setState(() {
            _isLoading = false;

          });
        }

    }
  }

  ImagePicker _imagePicker = ImagePicker();
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
      final response = await _authReference.uploadFile(filePath, true);
      print(response);
      print(json.decode(response));
      _uploadData['coverPhotoId'] = json.decode(response)['imageId'] + p.extension(filePath);
      print(p.extension(filePath));
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

  File _pickedImage;


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
  Auth _authReference;
  Books _booksReference;
  bool _isUpdate = false;
  Map<String, dynamic> _updateData = {};
  @override
  void didChangeDependencies() {
    _globalDataReference = Provider.of<GlobalData>(context, listen: false);

    if (_globalDataReference.categories == null ||
        _globalDataReference.categories.length == 0) {
      _getCategories();
    }
    final args = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    _authReference = Provider.of<Auth>(context, listen: false);
    _booksReference = Provider.of<Books>(context, listen: false);
    if(args != null && args != {} ) {
      _isUpdate = true;
      _updateData['id'] = args['id'];
      _updateData['title'] = args['title'];
      _updateData['copiesCount'] = args['copiesCount'];
      _updateData['coverPhotoId'] = args['coverPhotoId'];
      _updateData['description'] = args['description'];
      _updateData['author'] = args['author'];
      _updateData['categoryId'] = 1;
      _updateData['rating'] = 4;
      _updateData['statusId'] = 2;
      _updateData['price'] = 0;

    }

      super.didChangeDependencies();
  }
  GlobalData _globalDataReference;

  Future<void> _getCategories() async {
    try {
      await _globalDataReference.fetchCCategories();
    } on HttpException catch (e) {
      showErrorDialog(context, e.toString());
    } catch (e) {
      throw e;
    }
  }


  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;

    ScreenUtil.init(
      context,
      allowFontScaling: true,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(251, 192, 45, 1),
        title: Text(_isUpdate ? "Update book" : "Add Book"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),

              //// This InkWall of Container Only for Book Image
              InkWell(
                onTap: _openPickingOptions,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    AddPhotoAvatar(image: _pickedImage, photoId: _updateData['coverPhotoId'],),
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
                ),
              ),

              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),

              // input of 'BookName'
              InputText(
                inputTextName: _bookTitle,
                param: 'title',
                updateData: _updateData['title'],

              ),

              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),

              //input of AuthorName
              InputText(
                inputTextName: _authorName,
                param: 'author',
                updateData: _updateData['author'],

              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),

              //input of NoOfCopies
              InputText(
                inputTextName: _noOfCopies,
                param: 'copiesCount',
                updateData: _updateData['copiesCount']?.toString(),

              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),

              InputText(
                inputTextName: 'About',
                param: 'description',
                updateData: _updateData['description'],

              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),

              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Selector<GlobalData, List<Category>>(
                      selector: (_, globalData) => globalData.categories,
                      builder: (_, categories, __) =>
                     DropdownButtonFormField(
                      validator: (val) {
                        if (val == null) {
                          return 'Please, Choose Book Category';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        _uploadData['cagegoryId'] = val;
                      },
                      onChanged: (val) {
                        setState(() {
                          _categoryValue = val;
                          print(_categoryValue);
                        });
                      },
                      value: _categoryValue,
                      decoration: kInputDecoration.copyWith(
                          labelText: "Categories",
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(25),
                            vertical: ScreenUtil().setHeight(1),
                          )),
                      items: categories.map((val) {
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
                height: ScreenUtil().setHeight(15),
              ),

              //The ADD Button
              _isLoading
                  ? SizedBox(
                height: 50.0,
                child: Center(
                  child: Platform.isIOS
                      ? CupertinoActivityIndicator()
                      : CircularProgressIndicator(),
                ),
              )
                  : Buttons(
                onPressed: () => _submit(),
                buttonName: _isUpdate ? "Update" : "Add",
                //  onPressed: ,
              )
            ],
          ),
        ),
      ),
    );
  }
}

var kInputDecoration = InputDecoration(
  labelText: 'inputTextName',
  labelStyle: TextStyle(color: Colors.blueGrey),
  border: InputBorder.none,
  contentPadding: EdgeInsets.symmetric(
    horizontal: ScreenUtil().setWidth(25),
    vertical: ScreenUtil().setHeight(15),
  ),
);

class InputText extends StatelessWidget {
  String inputTextName = " ";
  String param;
  String updateData;
  InputText({
    this.inputTextName,
    this.param,
    this.updateData
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: TextFormField(
          initialValue: updateData ?? '',
          validator: (value) {
            if (value.isEmpty && inputTextName != 'About') {
              return 'Please, Enter $inputTextName';
            } else if (inputTextName == 'About') {
              if(value == null || value == '')_uploadData['description'] = 'No description written';
              return null;
            } else
              return null;
          },
          onSaved: (value) {
            if(inputTextName == _noOfCopies)
              _uploadData[param] = int.parse(value);
            else
              _uploadData[param] = value;
          },
          decoration: kInputDecoration.copyWith(labelText: inputTextName),
        ),
      ),
    );
  }
}
