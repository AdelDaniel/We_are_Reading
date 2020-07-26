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
  bool get isAuth => token != null;

  final User user;
  final Token token;
  Books(this.user, this.token, this._books, this._uploads);

  Future<void> fetchBooks() async {
    try {
      var response;
      if(isAuth)
       response = await http.get('$uri/api/Book/GetAllForOthers',headers: {'Authorization': 'Bearer ${token.accessToken}'});
      else
        response = await http.get('$uri/api/Book/GetAll');
      final parsedResponse = json.decode(response.body);
      if (response.statusCode != 200) {
        throw HttpException(response.body, response.statusCode);
      }
      _books.clear();
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

  Future<void> uploadBook(String encodedUploadData) async {
  print(json.decode(encodedUploadData));
    print(encodedUploadData);
    try {
      final response = await http.post('$uri/api/book/insert',
          body: encodedUploadData,
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

  Future<void> deleteBook(int id) async {
    try {
      final response = await http.delete('$uri/api/book/delete?bookId=$id',
          headers: {'Authorization': 'Bearer ${token.accessToken}'});
      if (response.statusCode != 200) {
        throw HttpException(response.body, response.statusCode);
      }
      _uploads.removeWhere((element) => element.id == id);
      notifyListeners();
    } catch (exp) {
      throw exp;
    }
  }

  Future<void> updateBook(Map<String, dynamic> updateData) async {
    final id = updateData['id'];
    print(id);
    updateData.remove('isUpdate');
    updateData.remove('id');
    print(updateData);
    print(json.encode(updateData));
    try {
      final response = await http.put('$uri/api/book/Update?bookId=$id',
          body: json.encode(updateData),
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