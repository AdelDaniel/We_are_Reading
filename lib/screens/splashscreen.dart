import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/providers/auth.dart';
import 'package:graduation/screens/main_screen.dart';
import 'package:graduation/screens/opening_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashscreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Size deviceSize;
  Future<void> hideScreen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final xx = Provider.of<Auth>(context, listen: false);
    bool isAuth = xx.isAuth;
    if (!isAuth) {
      isAuth = await xx.tryAutoLogin();
    }
    await Future.delayed(Duration(milliseconds: 1500), () async {
      await Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          opaque: true,
          settings: RouteSettings(
              name: isAuth ? MainScreen.routeName : Opening.routeName),
          transitionDuration: const Duration(milliseconds: 1200),
          pageBuilder: (BuildContext context, _, __) =>
              isAuth ? MainScreen() : Opening(),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) =>
                  FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  bool hided = false;

  @override
  void didChangeDependencies() {
//    Provider.of<GlobalData>(context, listen: false).getCountriesAndCategories();
//    Provider.of<GlobalData>(context, listen: false).getCountriesAndCategories();
    // TODO: implement didChangeDependencies

    if (!hided) {
      hideScreen();
      hided = true;
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: deviceSize.width,
        height: deviceSize.height,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Hero(
            tag: 'splash-logo',
            child: Image.asset('assets/images/logo_with_word.png')),
      ),
    );
  }
}
