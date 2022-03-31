
import 'dart:convert';

List<Course> courseFromJson(List<dynamic> str) => List<Course>.from(str.map((x) => Course.fromJson(x)));

String courseToJson(List<Course> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
  Course({
    required this.id,
    required this.title,
    required this.description,
    this.thumbnail,
    required this.date,
    required this.teacher,
  });

  int id;
  String title;
  String description;
  String? thumbnail;
  DateTime date;
  int teacher;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    thumbnail: json["thumbnail"],
    date: DateTime.parse(json["date"]),
    teacher: json["teacher"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "thumbnail": thumbnail,
    "date": date.toIso8601String(),
    "teacher": teacher,
  };
}

