import 'package:flutter/foundation.dart';

import '../models/user_data.dart';

class UserProvider extends ChangeNotifier {
  List<UserData> _userItems=[
    // Dummy data
  ];

  List<UserData> get userItems =>[..._userItems];
}