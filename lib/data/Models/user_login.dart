import 'dart:convert';

List<UserLogin> userLoginFromJson(String str) => List<UserLogin>.from(json.decode(str).map((x) => UserLogin.fromJson(x)));

String userLoginToJson(List<UserLogin> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserLogin {
  UserLogin({
    required this.token,
    required this.userId,
    required this.isStudent,
  });

  String token;
  int userId;
  bool isStudent;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
    token: json["token"],
    userId: json["user_id"],
    isStudent: json["is_student"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user_id": userId,
    "is_student": isStudent,
  };
}
