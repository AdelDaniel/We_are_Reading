import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Providers/book_provider.dart';
import './Providers/library_provider.dart';
import './Providers/location_provider.dart';
import './Providers/user_provider.dart';
import './screens/add_book_screen.dart';
import './screens/after_request_from_lib_screen.dart';
import './screens/login_screen.dart';
import './screens/navigation_screen.dart';
import './screens/opening_screen.dart';
import './screens/profile_screen.dart';
import './screens/signup_borrower_screen.dart';
import './screens/signup_library_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: locationinfo()),
        ChangeNotifierProvider<LibraryProvider>(
          create: (context) => LibraryProvider(),
        ),
        ChangeNotifierProvider.value(
          value: BookProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
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
          SignupLib.routeName: (context) => SignupLib(),
          SignUpBorrower.routeName: (context) => SignUpBorrower(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
          AddBookScreen.routename: (context) => AddBookScreen(),
          AfterBorrowScreen.routeName: (context) => AfterBorrowScreen(),
          FancyBottomBarPage.routeName: (context) => FancyBottomBarPage(),
        },
      ),
    );
  }
}
