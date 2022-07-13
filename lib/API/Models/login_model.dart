
class LoginModel {
  String? token;
  int? userId;
  String? profile;

  LoginModel({this.token, this.userId, this.profile});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json["token"];
    userId = json["user_id"];
    profile = json["profile"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["token"] = token;
    data["user_id"] = userId;
    data["profile"] = profile;
    return data;
  }
}