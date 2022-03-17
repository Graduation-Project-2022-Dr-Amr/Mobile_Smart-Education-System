class UserModel {
  String? message;
  String? token;
  int? user_id;

  UserData? data;

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    user_id = json['user_id'];
    data = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }
}

class UserData {
  String? username;
  String? email;
  String? password;
  String? Confirmpassword;
  bool? is_student;

  UserData.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    Confirmpassword = json['password2'];
    is_student = json['is_student'];
  }
}
