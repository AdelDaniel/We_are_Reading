import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/models/city.dart';
import 'package:graduation/models/user.dart';
import 'package:http/http.dart' as http;

final String uri = 'https://wearereading20200721193701.azurewebsites.net';

class GlobalData with ChangeNotifier {

  final User user;

  GlobalData(this.user, this._cities);

  List<City> _cities = [];
  List<City> get cities => [..._cities];


  Future<void> fetchCities() async {
    try {
      final response = await http.get('$uri/api/Government/GetAll',
          );
      final cities = json.decode(response.body);
      if (response.statusCode != 200) throw HttpException(cities['message']);
      _cities = [];
      cities.forEach((item) {
        _cities.add(City.fromJsonMap(item));
      });
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

}