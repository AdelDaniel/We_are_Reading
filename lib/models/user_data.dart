import 'package:flutter/foundation.dart';

class UserData {
  final String name;
  final String email;
  final String password;
  final int mobileNum;
  final String governorate;
  final String idPhoto;
  final String userId;

  UserData({
    @required this.name,
    @required this.userId,
    @required this.email,
    @required this.governorate,
    @required this.idPhoto,
    @required this.mobileNum,
    @required this.password,
  });
}
