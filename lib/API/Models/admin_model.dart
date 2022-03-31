class AdminModel {
  String? token;
  int? userId;
  bool? isStudent;

  AdminModel({this.token, this.userId, this.isStudent});

  AdminModel.fromJson(Map<String, dynamic> json) {
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
