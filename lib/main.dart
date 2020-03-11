import 'package:flutter/material.dart';
import './screens/opening_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyShop',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(251, 192, 45, 1),
        //accentColor: Colors.deepOrange,
        fontFamily: 'Poppins',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(63, 61, 86, 1),
              ),
            ),
      ),
      home: Opening(),
    );
  }
}
