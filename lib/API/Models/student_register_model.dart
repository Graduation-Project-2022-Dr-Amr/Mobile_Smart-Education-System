class StudentRegisterModel {
  User? user;
  String? token;
  String? message;

  StudentRegisterModel({this.user, this.token, this.message});

  StudentRegisterModel.fromJson(Map<String, dynamic> json) {
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    token = json["token"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) data["user"] = user?.toJson();
    data["token"] = token;
    data["message"] = message;
    return data;
  }
}

class User {
  String? username;
  String? email;
  String? password;
  bool? isStudent;

  User({this.username, this.email, this.password, this.isStudent});

  User.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    email = json["email"];
    password = json["password"];
    isStudent = json["is_student"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["username"] = username;
    data["email"] = email;
    data["password"] = password;
    data["is_student"] = isStudent;
    return data;
  }
}
/////////////////////////////////////////


class Test {
  String? token;
  int? userId;
  bool? isStudent;

  Test({this.token, this.userId, this.isStudent});

  Test.fromJson(Map<String, dynamic> json) {
    token = json["token"];
    userId = json["user_id"];
    isStudent = json["is_student"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["token"] = token;
    data["user_id"] = userId;
    data["is_student"] = isStudent;
    return data;
  }
}