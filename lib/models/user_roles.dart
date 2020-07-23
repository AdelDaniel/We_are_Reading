
class UserRoles {

  int userId;
  int roleId;
  String roleName;
  String userName;

	UserRoles.fromJsonMap(Map<String, dynamic> map): 
		userId = map["userId"],
		roleId = map["roleId"],
		roleName = map["roleName"],
		userName = map["userName"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['userId'] = userId;
		data['roleId'] = roleId;
		data['roleName'] = roleName;
		data['userName'] = userName;
		return data;
	}
}
