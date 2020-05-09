import 'package:device_simulator/device_simulator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Screens/navigation_screen.dart';
import './Screens/opening_screen.dart';
import './Screens/profile_screen.dart';
import './screens/login_screen.dart';
import './Screens/add_book_screen.dart';
import './screens/signupLibrary_screen.dart';
import './Screens/signupBorrower_screen.dart';
import './Screens/After_Request_From_Lib_Screen.dart';
import './Providers/location_provider.dart';
import './Providers/book_provider.dart';
import './Providers/user_provider.dart';
import './Providers/library_provider.dart';

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
          signupLib.routeName: (context) => signupLib(),
          signupBorrower.routeName: (context) => signupBorrower(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
          AddBookScreen.routename: (context) => AddBookScreen(),
          afterborrowScreen.routeName: (context) => afterborrowScreen(),
          FancyBottomBarPage.routeName: (context) => FancyBottomBarPage(),
        },
      ),
    );
  }
}
