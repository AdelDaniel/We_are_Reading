import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation/models/http_exception.dart';
import 'package:graduation/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



final String uri = 'https://wearereading20200721193701.azurewebsites.net';

class Auth with ChangeNotifier {
  User _user;
  String _token;
  String _userId;

  bool get isAuth => (_token != null) && (_token != '');
//
  String get token => _token;
//
  User get user => _user;
//
  String get userId => _userId;
//




  Future<String> register(Map<String, dynamic> userData) async {
    print(userData);
    try {
      final response = await http.post('$uri/api/account/register',
          body: json.encode(userData), headers: {'Content-Type' : 'application/json'});

      final responseData = json.decode(response.body);
      if (response.statusCode != 200) {
        throw HttpException(
            responseData['message'], response.statusCode);
      }

//      final SharedPreferences prefs = await SharedPreferences.getInstance();
//      prefs.setString('userData', response.body);
////      setUser(response.body);
//      return response.body;
    } catch(error) {
      throw error;
    }
  }
}