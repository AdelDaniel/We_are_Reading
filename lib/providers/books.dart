import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation/models/book.dart';
import 'package:graduation/models/http_exception.dart';
import 'package:graduation/models/token.dart';
import 'package:graduation/models/user.dart';
import 'package:http/http.dart' as http;

final String uri = 'https://wearereading20200721193701.azurewebsites.net';


class Books with ChangeNotifier {
  List<Book> _books = [];
  List<Book> get books => _books;
  List<Book> _uploads = [];
  List<Book> get uploads => _uploads;

  final User user;
  final Token token;
  Books(this.user, this.token, this._books, this._uploads);

  Future<void> fetchBooks() async {
    try {
      final response = await http.get('$uri/api/Book/GetAll');
      final parsedResponse = json.decode(response.body);
      if (response.statusCode != 200) {
        throw HttpException(response.body, response.statusCode);
      }
      parsedResponse.forEach((item) {
        _books.add(Book.fromJsonMap(item));
      });

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
  Future<void> fetchUploads() async {
    try {
      final response = await http.get('$uri/api/Book/GetAllForUser?userId=${user.userId}');
      final parsedResponse = json.decode(response.body);
      if (response.statusCode != 200) {
        throw HttpException(response.body, response.statusCode);
      }
      _uploads.clear();
      parsedResponse.forEach((item) {
        _uploads.add(Book.fromJsonMap(item));
      });

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> uploadBook(String encodedLoginData) async {
  print(json.decode(encodedLoginData));
    print(encodedLoginData);
    try {
      final response = await http.post('$uri/api/book/insert',
          body: encodedLoginData,
          headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer ${token.accessToken}'});
      if (response.statusCode != 200) {
        throw HttpException(response.body, response.statusCode);
      }
      final parsedResponse = json.decode(response.body);
      _uploads.add(Book.fromJsonMap(parsedResponse));
      notifyListeners();

    } catch (exp) {
      throw exp;
    }
  }


}