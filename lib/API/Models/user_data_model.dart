class UserData {
  int? user;
  String? picture;
  String? phone;
  String? collegeId;
  String? univeristyName;
  String? majorTypes;
  String? facebook;
  String? github;
  String? linkedin;
  String? userType;
  int? points;

  UserData(
      {this.user,
      this.picture,
      this.phone,
      this.collegeId,
      this.univeristyName,
      this.majorTypes,
      this.facebook,
      this.github,
      this.linkedin,
      this.userType,
      this.points});

  UserData.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    picture = json['picture'];
    phone = json['phone'];
    collegeId = json['college_id'];
    univeristyName = json['univeristy_name'];
    majorTypes = json['major_types'];
    facebook = json['facebook'];
    github = json['github'];
    linkedin = json['linkedin'];
    userType = json['user_type'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['picture'] = this.picture;
    data['phone'] = this.phone;
    data['college_id'] = this.collegeId;
    data['univeristy_name'] = this.univeristyName;
    data['major_types'] = this.majorTypes;
    data['facebook'] = this.facebook;
    data['github'] = this.github;
    data['linkedin'] = this.linkedin;
    data['user_type'] = this.userType;
    data['points'] = this.points;
    return data;
  }
}
