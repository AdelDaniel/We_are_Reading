import 'package:graduation/models/user_roles.dart';

class User {
  int userId;
  String userName;
  String email;
  String fullName;
  int roleId;
  String roleName;
  String defaultCulture;
  List<UserRoles> userRoles;

  User.fromJsonMap(Map<String, dynamic> map)
      : userId = map["userId"],
        userName = map["userName"],
        email = map["email"],
        fullName = map["fullName"],
        roleId = map["roleId"],
        roleName = map["roleName"],
        defaultCulture = map["defaultCulture"],
        userRoles = map["userRoles"]
                ?.map((it) => UserRoles.fromJsonMap(it))
                ?.toList() ??
            [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = userId;
    data['userName'] = userName;
    data['email'] = email;
    data['fullName'] = fullName;
    data['roleId'] = roleId;
    data['roleName'] = roleName;
    data['defaultCulture'] = defaultCulture;
    data['userRoles'] = userRoles != null
        ? this.userRoles.map((v) => v.toJson()).toList()
        : null;
    return data;
  }
}
