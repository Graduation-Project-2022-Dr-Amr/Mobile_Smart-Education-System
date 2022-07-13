import 'dart:convert';

List<Course> courseFromJson(List<dynamic> str) => List<Course>.from(str.map((x) => Course.fromJson(x)));

String courseToJson(List<Course> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
  String? id;
  String? picture;
  String? title;
  String? description;
  String? university;
  String? majorTypes;
  int? category;
  int? user;
  List<int>? enrolled;
  List<int>? modules;
  List<int>? questions;

  Course(
      {this.id,
      this.picture,
      this.title,
      this.description,
      this.university,
      this.majorTypes,
      this.category,
      this.user,
      this.enrolled,
      this.modules,
      this.questions});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    picture = json['picture'];
    title = json['title'];
    description = json['description'];
    university = json['university'];
    majorTypes = json['major_types'];
    category = json['category'];
    user = json['user'];
    enrolled = json['enrolled'].cast<int>();
    modules = json['modules'].cast<int>();
    questions = json['questions'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['picture'] = this.picture;
    data['title'] = this.title;
    data['description'] = this.description;
    data['university'] = this.university;
    data['major_types'] = this.majorTypes;
    data['category'] = this.category;
    data['user'] = this.user;
    data['enrolled'] = this.enrolled;
    data['modules'] = this.modules;
    data['questions'] = this.questions;
    return data;
  }
}
