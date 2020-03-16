import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/opening_screen.dart';
import './screens/login_screen.dart';
import './screens/signupLibrary_screen.dart';
import './Screens/signupBorrower.dart';
import './Providers/location_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: locationinfo()),
      ],
      child: MaterialApp(
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
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          signupLib.routeName: (context) => signupLib(),
          signupBorrower.routeName: (context) => signupBorrower(),
        },
      ),
    );
  }
}
