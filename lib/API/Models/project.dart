import 'package:flutter/foundation.dart';

class Project {
  String id;
  String title;
  String description;
  String department;

  String doctor;
  List students;

  List languages;
  List frameworks;
  List tools;
  List fields;
  List others;

  int year;
  int grade;

  String driveLink;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.department,
    required this.doctor,
    required this.students,
    required this.languages,
    required this.frameworks,
    required this.tools,
    required this.fields,
    required this.others,
    required this.year,
    required this.grade,
    required this.driveLink,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        department: json['department'],
        doctor: json['doctor'],
        students: json['students'],
        languages: json['languages'],
        frameworks: json['frameworks'],
        tools: json['tools'],
        fields: json['fields'],
        others: json['others'],
    year: json['year'],
    grade: json['grade'],
    driveLink: json['driveLink'],
      );
}
