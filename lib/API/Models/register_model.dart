
class RegisterModel {
  User? user;
  String? profile;
  String? token;
  String? message;

  RegisterModel({this.user, this.profile, this.token, this.message});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    profile = json["profile"];
    token = json["token"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(user != null)
      data["user"] = user?.toJson();
    data["profile"] = profile;
    data["token"] = token;
    data["message"] = message;
    return data;
  }
}

class User {
  String? username;
  String? email;
  String? password;

  User({this.username, this.email, this.password});

  User.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    email = json["email"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["username"] = username;
    data["email"] = email;
    data["password"] = password;
    return data;
  }
}