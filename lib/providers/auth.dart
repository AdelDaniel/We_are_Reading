import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:graduation/models/http_exception.dart';
import 'package:graduation/models/token.dart';
import 'package:graduation/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String uri = 'https://wearereading20200721193701.azurewebsites.net';

class Auth with ChangeNotifier {
  User _user;
  Token _token;

  bool get isAuth => _token != null;

  Token get token => _token;

  User get user => _user;

  Future<void> login(String encodedLoginData) async {
    try {
      final response = await http.post('$uri/api/Account/Login',
          body: encodedLoginData,
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode != 200) {
        throw HttpException(response.body, response.statusCode);
      }
      final responseData = json.decode(response.body);
      await setToken(responseData);
      await _getUserDetailsWithToken();
      return true;
    } catch (exp) {
      throw exp;
    }
  }

  Future<void> _refreshToken() async {
    try {
      final response = await http.post(
          '$uri/api/Account/RefreshToken?RefreshToken=${token.refreshToken}',
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode != 200) {
        throw HttpException(response.body, response.statusCode);
      }
      final responseData = json.decode(response.body);
      await setToken(responseData);
      return true;
    } catch (exp) {
      throw exp;
    }
  }

  Future<bool> tryAutoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData') || !prefs.containsKey('token'))
      return false;
    final String storedUserData = prefs.getString('userData');
    final String myToken = prefs.getString('token');
    Map<String, dynamic> userData =
        json.decode(storedUserData) as Map<String, dynamic>;
    await setToken(json.decode(myToken));
    await _refreshToken();
    await setUser(storedUserData);
    notifyListeners();
    return true;
  }

  Future<void> _getUserDetailsWithToken() async {
    final String url = '$uri/api/Account/GetUserAuthTicket';
    try {
      final response = await http
          .get(url, headers: {'Authorization': 'Bearer ${token.accessToken}'});
      if (response.statusCode != 200) {
        throw HttpException(response.body, response.statusCode);
      }
      await setUser(response.body, true);
      return true;
    } catch (exp) {
      throw exp;
    }
  }

  Future<void> setUser(String encodedUserMap, [bool store = false]) async {
    Map<String, dynamic> userData = json.decode(encodedUserMap);
    _user = User.fromJsonMap(userData);
    if (store) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userData', encodedUserMap);
    }
  }

  Future<void> setToken(Map<String, dynamic> myToken) async {
    _token = Token.fromJson(myToken);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', json.encode(myToken));
  }

  Future<String> uploadFile(String filePath) async {
    try {
      // string to uri
      var url = Uri.parse("$uri/api/Account/UploadUserImage");

      // create multipart request
      var request = new http.MultipartRequest("POST", url);

      // multipart that takes file
      if (filePath != null && filePath.isNotEmpty) {
        final File myFile = File(filePath);
        var stream =
            new http.ByteStream(DelegatingStream.typed(myFile.openRead()));
        // get file length
        var length = await myFile.length();
        var multipartFile = new http.MultipartFile('Photo', stream, length,
            filename: basename(myFile.path));
        request.files.add(multipartFile);
      }
      var response = await request.send();
      final respStr = await response.stream.bytesToString();
      if (response.statusCode != 200) {
        throw HttpException(
            json.decode(respStr)['message'], response.statusCode);
      }
      notifyListeners();
      return respStr;
    } catch (error) {
      throw error;
    }
  }

  Future<void> register(Map<String, dynamic> userData) async {
    print(userData);
    try {
      final response = await http.post('$uri/api/account/register',
          body: json.encode(userData),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode != 200) {
        throw HttpException(response.body, response.statusCode);
      }
    } catch (error) {
      throw error;
    }
  }
}
