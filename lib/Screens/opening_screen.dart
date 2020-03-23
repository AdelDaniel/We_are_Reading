import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

import './login_screen.dart';
import './signupLibrary_screen.dart';
import './signupBorrower.dart';

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
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: h * .9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Logo',
                        style: TextStyle(fontSize: 29),
                      ),
                      height: h * 0.0625,
                      margin: EdgeInsets.fromLTRB(0, h * 0.15, 0, 0),
                    ),
                    CarouselSlider.builder(
                        height: h * .45,
                        viewportFraction: 1.0,
                        itemCount: 3,
                        onPageChanged: ((index) {
                          setState(() {
                            _current = index;
                          });
                        }),
                        itemBuilder: (ctx, index) {
                          return carouseItem(
                              ctx, imgs[index], titles[index], descs[index]);
                        }),
                    DotsIndicator(
                      dotsCount: 3,
                      position: _current.toDouble(),
                      decorator: DotsDecorator(
                          activeColor: Theme.of(context).primaryColor),
                    ),
                    buildButtonTheme(w, h, context, 'Login', loginFunction),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Not Registered ?',
                          style: TextStyle(
                              color: Color.fromRGBO(136, 98, 4, 1),
                              fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  return Container(
                                    height: 190,
                                    padding: EdgeInsets.all(25),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        buildButtonTheme(w, h, context,
                                            'Borrower', _gotosignupBorrower),
                                        Text('or'),
                                        buildButtonTheme(w, h, context,
                                            'Library', _gotosignupLib),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Text('Sign up',
                              style: TextStyle(
                                  color: Color.fromRGBO(136, 98, 4, 1),
                                  fontSize: 15,
                                  decoration: TextDecoration.underline)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: h * .07,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: InkWell(
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(136, 98, 4, 1),
                          ),
                        ),
                        onTap: () {},
                      ),
                      right: w * .05,
                      bottom: h * .01,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget carouseItem(BuildContext ctx, String img, String title, String info) {
    final h = MediaQuery.of(ctx).size.height;
    final w = MediaQuery.of(ctx).size.width;
    return Column(
      children: <Widget>[
        SizedBox(
          width: w,
          height: h * .26,
          child: ClipRect(
            child: Image.asset(
              img,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Container(
          height: h * 0.06875,
          width: w * 0.6861,
          child: Text(
            info,
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget buildButtonTheme(
      double w, double h, BuildContext context, String txt, Function ToDo) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ButtonTheme(
        minWidth: w * .6,
        height: 38,
        child: FlatButton(
          onPressed: ToDo,
          child: Text(
            txt,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
