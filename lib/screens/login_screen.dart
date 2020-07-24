import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/mixins/alerts_mixin.dart';
import 'package:graduation/mixins/validation_mixin.dart';
import 'package:graduation/models/http_exception.dart';
import 'package:graduation/providers/auth.dart';
import 'package:provider/provider.dart';

import './signup_borrower_screen.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with AlertsMixin, ValidationMixin {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  var args;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  Map<String, dynamic> _authData = {
    'username': '',
    'password': '',
  };

  Auth _authReference;

  bool _isLoading = false;

  Future<void> _login() async {
    if (_loginFormKey.currentState.validate()) {
      _loginFormKey.currentState.save();
      setState(() {
        _isLoading = true;
      });
      try {
        final regResponse = await _authReference.login(json.encode(_authData));
//        if (Navigator.of(context).canPop()) {
//          Navigator.of(context).pop();
//        } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false);
//        }
      } on HttpException catch (error) {
        showErrorDialog(
            context, error.toString(), Duration(milliseconds: 1500));
      } catch (error) {
        throw error;
      }
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
  }

  @override
  void didChangeDependencies() {
    _authReference = Provider.of<Auth>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
    });
    _focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _loginFormKey,
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipper2(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0x44ffe29e), Color(0x44ffe29e)])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper3(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0x99fbe197), Color(0x99ffe29e)])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper1(),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Icon(
                          Icons.library_books,
                          color: Colors.white,
                          size: 60,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Logo",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 30),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xfffbc02d), Color(0xfffac02e)])),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextFormField(
                      validator: validateUsername,
                      focusNode: _focusNode1,
                      onSaved: (value) {
                        _authData['username'] = value;
                      },
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (val) {
                        _focusNode1.unfocus();
                        FocusScope.of(context).requestFocus(_focusNode2);
                      },
                      decoration: InputDecoration(
                          labelText: "username",
                          labelStyle: TextStyle(color: Colors.blueGrey),
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(
                              Icons.person,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
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
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty || value.length < 5) {
                          return 'Password is too short!';
                        }
                        return null;
                      },
                      focusNode: _focusNode2,
                      onFieldSubmitted: (val) {
                        _focusNode2.unfocus();
                        _login();
                      },
                      onSaved: (value) {
                        _authData['password'] = value;
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.blueGrey),
                          labelText: "Password",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(
                              Icons.lock,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
//                  width: ScreenUtil().setWidth(355),
                  width: double.infinity,
                  child: Padding(
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
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  color: Theme.of(context).primaryColor),
                              child: FlatButton(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                onPressed: _login,
                              ),
                            )),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an Account ? ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return Container(
                                height: ScreenUtil().setHeight(200),
                                padding:
                                    EdgeInsets.all(ScreenUtil().setHeight(5)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    buildButtonTheme(context, 'Borrower',
                                        () => _goToSignUp()),
                                    Text('or'),
                                    buildButtonTheme(context, 'Library',
                                        () => _goToSignUp(true)),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Text('Sign up',
                          style: TextStyle(
                              color: Color.fromRGBO(136, 98, 4, 1),
                              fontSize: ScreenUtil().setSp(15),
                              decoration: TextDecoration.underline)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildButtonTheme(BuildContext context, String txt, Function toDo) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ButtonTheme(
        minWidth: ScreenUtil().setWidth(220),
        height: ScreenUtil().setHeight(38),
        child: FlatButton(
          onPressed: toDo,
          child: Text(
            txt,
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(18),
                fontWeight: FontWeight.bold),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Future<void> _goToSignUp([bool isLibrary = false]) async {
    Navigator.of(context).pop();
    final xx = (await Navigator.of(context).pushNamed(SignUpBorrower.routeName,
            arguments: {'roleId': isLibrary ? 2 : 1})) ??
        false;
    if (xx)
      showSuccessBottomSheet(context, 'Registered successfully',
          'You have registered successfully, you can login now.');
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
