import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './login_screen.dart';
import './signupLibrary_screen.dart';
import './signupBorrower_screen.dart';
import './navigation_screen.dart';

class Opening extends StatefulWidget {
  @override
  _OpeningState createState() => _OpeningState();
}

class _OpeningState extends State<Opening> {
  List<String> imgs = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png'
  ];

  List<String> titles = [
    'Ability of sharing books.',
    'Read the book\'s reviews.',
    'Select library to borrow from.'
  ];

  List<String> descs = [
    'Get the knowledge you want and read the books you need to.',
    'Have a look at some quotes and reviews of the book you want.',
    'Borrow any book you want.'
  ];
  int _current = 0;

  void loginFunction() {
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  void _gotosignupLib() {
    Navigator.of(context).pushNamed(signupLib.routeName);
  }

  void _gotosignupBorrower() {
    Navigator.of(context).pushNamed(signupBorrower.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    ScreenUtil.init(
      context,
      allowFontScaling: true,
      width: 400,
      height: 810,
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(double.infinity),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Text(
                              'Logo',
                              style:
                                  TextStyle(fontSize: ScreenUtil().setSp(28)),
                            ),
                            height: ScreenUtil().setHeight(50),
                            margin: EdgeInsets.fromLTRB(
                                0, ScreenUtil().setHeight(32), 0, 0)),
                        CarouselSlider.builder(
                            height: ScreenUtil().setHeight(350),
                            viewportFraction: 1.0,
                            itemCount: 3,
                            onPageChanged: ((index) {
                              setState(() {
                                _current = index;
                              });
                            }),
                            itemBuilder: (ctx, index) {
                              return carouseItem(ctx, imgs[index],
                                  titles[index], descs[index]);
                            }),
                        DotsIndicator(
                          dotsCount: 3,
                          position: _current.toDouble(),
                          decorator: DotsDecorator(
                              activeColor: Theme.of(context).primaryColor),
                        ),
                        buildButtonTheme(context, 'Login', loginFunction),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Not Registered ?',
                              style: TextStyle(
                                  color: Color.fromRGBO(136, 98, 4, 1),
                                  fontSize: ScreenUtil().setSp(15)),
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (_) {
                                      return Container(
                                        height: ScreenUtil().setHeight(200),
                                        padding: EdgeInsets.all(
                                            ScreenUtil().setHeight(5)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            buildButtonTheme(
                                                context,
                                                'Borrower',
                                                _gotosignupBorrower),
                                            Text('or'),
                                            buildButtonTheme(context, 'Library',
                                                _gotosignupLib),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(20),
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: InkWell(
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(18),
                    color: Color.fromRGBO(136, 98, 4, 1),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(FancyBottomBarPage.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget carouseItem(BuildContext ctx, String img, String title, String info) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: ScreenUtil().setWidth(double.infinity),
          height: ScreenUtil().setHeight(231),
          child: ClipRect(
            child: Image.asset(
              img,
            ),
          ),
        ),
        Container(
          height: ScreenUtil().setHeight(43),
          child: Text(
            title,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(24),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ),
        Container(
          height: ScreenUtil().setHeight(68),
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: ScreenUtil().setWidth(double.infinity),
          child: Text(
            info,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(18),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget buildButtonTheme(BuildContext context, String txt, Function ToDo) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ButtonTheme(
        minWidth: ScreenUtil().setWidth(220),
        height: ScreenUtil().setHeight(38),
        child: FlatButton(
          onPressed: ToDo,
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
}
