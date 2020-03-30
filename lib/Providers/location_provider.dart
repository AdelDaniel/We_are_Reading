import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class locationinfo with ChangeNotifier {
  Future<String> getPlaceAddress(double lat, double lng) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final url =
            'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=';
        final response = await http.get(url);
        notifyListeners();
        return json.decode(response.body)['results'][0]['formatted_address'];
      }
    } on SocketException catch (_) {
      print('Dis');
      notifyListeners();
      return null;
    }
  }
}
