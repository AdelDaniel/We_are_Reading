import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

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

final Map<String, Object> _addBookData = {
  _libName: '',
  _bookImage: '',
  _bookTitle: '',
  _authorName: '',
  _noOfCopies: '',
  _bookCategory: '',
  'About ': '',
};

///*****************************************************///

class AddBookScreen extends StatefulWidget {
  static const routeName = '/add-book-library';
  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();
  var _categoryValue;

  /// Getting Image From The User  In 2 Ways Gallery or Taking Photo
  File _image;
  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      _addBookData[_bookImage] = _image;
    });
  }

  final List<String> kCategories = [
    'Science Fiction',
    'satire',
    'drama',
    'Action and Adventure',
    'Romance',
    'mystery',
    'horror',
    'self help',
    'guide',
    'travel',
    "children's",
    'religious',
    'science',
    'history',
    'math',
    'anthologies',
    'poetry',
    'encyclopedia',
    'dictionaries',
    'comics',
    'art',
    'cookbooks',
    'diaries',
    'prayer books',
    'series',
    'trilogies',
    'biographies',
    'autobiographies',
    'fantasy'
  ];

  Future getImageFromDevice() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      _addBookData[_bookImage] = _image;
    });
  }

  /// if the user pressed Add Button
  void _submit() {
    if (_formKey.currentState.validate()) {
      if (_image == null) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Missing Data'),
                content: Text('it is prefered to upload an image'),
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
      } else {
        _formKey.currentState.save();
        print('Done');
      }
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
        title: Text("Add Book"),
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
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return Container(
                          height: ScreenUtil().setHeight(400),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Buttons(
                                buttonName: 'Take a Photo',
                                onPressed: () => getImageFromCamera(),
                              ),
                              Buttons(
                                buttonName: 'UpLoad From Your Phone',
                                onPressed: () => getImageFromDevice(),
                              ),
                              Buttons(
                                  buttonName: 'Remove Image',
                                  onPressed: () {
                                    //_image == null;
                                    // _image.delete(recursive: false) ;
                                    //_image.deleteSync(recursive: true) ;
                                  }),
                            ],
                          ),
                        );
                      });
                },
                child: AddPhotoAvatar(image: _image),
              ),

              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),

              // input of 'BookName'
              InputText(
                inputTextName: _bookTitle,
              ),

              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),

              //input of AuthorName
              InputText(
                inputTextName: _authorName,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),

              //input of NoOfCopies
              InputText(
                inputTextName: _noOfCopies,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),

              InputText(
                inputTextName: 'About',
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
                  child: DropdownButtonFormField(
                    validator: (val) {
                      if (val == null) {
                        return 'Please, Choose Book Category';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      _addBookData[_bookCategory] = val;
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
                    items: kCategories.map((val) {
                      return DropdownMenuItem(
                        child: Text(val),
                        value: val,
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),

              //The ADD Button
              Buttons(
                onPressed: () => _submit(),
                buttonName: "Add",
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
  InputText({
    this.inputTextName,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: TextFormField(
          validator: (value) {
            if (value.isEmpty && inputTextName != 'About') {
              return 'Please, Enter $inputTextName';
            } else if (inputTextName == 'About') {
              _addBookData[inputTextName] = 'No Data Entered ';
              return 'No Data Entered ';
            } else
              return null;
          },
          onSaved: (value) {
            _addBookData[inputTextName] = value;
          },
          decoration: kInputDecoration.copyWith(labelText: inputTextName),
        ),
      ),
    );
  }
}
