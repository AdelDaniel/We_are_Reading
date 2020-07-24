import 'package:flutter/material.dart';
import 'package:graduation/providers/auth.dart';
import 'package:graduation/providers/books.dart';
import 'package:graduation/providers/global_data.dart';
import 'package:graduation/providers/location_provider.dart';
import 'package:graduation/screens/splashscreen.dart';
import 'package:provider/provider.dart';

import './Providers/book_provider.dart';
import './Providers/library_provider.dart';
import './Providers/user_provider.dart';
import './screens/add_book_screen.dart';
import './screens/after_request_from_lib_screen.dart';
import './screens/login_screen.dart';
import './screens/main_screen.dart';
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
        ChangeNotifierProvider<Auth>(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, GlobalData>(
          update: (_, auth, previous) => GlobalData(
            auth.user,
            previous?.cities ?? [],
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Books>(
          update: (_, auth, previous) => Books(
              auth.user,
              auth.token,
              previous == null ? [] : previous.books,
              previous == null ? [] : previous.uploads,

          ),
        ),
        ChangeNotifierProvider.value(value: LocationInfo()),
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
        title: 'Naqraa',
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
        home: SplashScreen(),
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          SignupLib.routeName: (context) => SignupLib(),
          Opening.routeName: (context) => Opening(),
          SignUpBorrower.routeName: (context) => SignUpBorrower(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
          AddBookScreen.routeName: (context) => AddBookScreen(),
          AfterBorrowScreen.routeName: (context) => AfterBorrowScreen(),
          MainScreen.routeName: (context) => MainScreen(),
        },
      ),
    );
  }
}
