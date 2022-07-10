// To parse this JSON data, do
//
//     final chapter = chapterFromJson(jsonString);

import 'dart:convert';

List<Chapter> chapterFromJson(List<dynamic> str) => List<Chapter>.from(str.map((x) => Chapter.fromJson(x)));

String chapterToJson(List<Chapter> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chapter {
  Chapter({
    required this.id,
    required this.chapterName,
    required this.serialNumber,
    required this.course,
  });

  int id;
  String chapterName;
  int serialNumber;
  int course;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
    id: json["id"],
    chapterName: json["chapter_name"],
    serialNumber: json["serial_number"],
    course: json["course"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "chapter_name": chapterName,
    "serial_number": serialNumber,
    "course": course,
  };
}








































// To parse this JSON data, do
//
//     final chapter = chapterFromJson(jsonString);
//
// import 'dart:convert';
//
// List<Chapter> chapterFromJson(List<dynamic> str) => List<Chapter>.from(str.map((x) => Chapter.fromJson(x)));
//
// String chapterToJson(List<Chapter> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Chapter {
//   Chapter({
//     required this.id,
//     required this.title,
//     required this.serialNumber,
//     required this.videoId,
//     required this.instructorword,
//     required this.resource,
//     required this.assignment,
//     required this.whichCourse,
//     required this.whichChapter,
//   });
//
//   int id;
//   String title;
//   int serialNumber;
//   String videoId;
//   String instructorword;
//   String resource;
//   String assignment;
//   int whichCourse;
//   int whichChapter;
//
//   factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
//     id: json["id"],
//     title: json["title"],
//     serialNumber: json["serial_number"],
//     videoId: json["video_id"],
//     instructorword: json["instructorword"],
//     resource: json["resource"],
//     assignment: json["assignment"],
//     whichCourse: json["which_course"],
//     whichChapter: json["which_chapter"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "serial_number": serialNumber,
//     "video_id": videoId,
//     "instructorword": instructorword,
//     "resource": resource,
//     "assignment": assignment,
//     "which_course": whichCourse,
//     "which_chapter": whichChapter,
//   };
// }
//
