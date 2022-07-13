import 'dart:convert';

List<Video> videoFromJson(List<dynamic> str) => List<Video>.from(str.map((x) => Video.fromJson(x)));

String videoToJson(List<Video> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Video {
  Video({
    required this.id,
    required this.title,
    required this.serialNumber,
    required this.videoId,
    required this.instructorword,
    required this.resource,
    required this.assignment,
    required this.whichCourse,
    required this.whichChapter,
  });

  int id;
  String title;
  int serialNumber;
  String videoId;
  String instructorword;
  String resource;
  String assignment;
  int whichCourse;
  int whichChapter;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    id: json["id"],
    title: json["title"],
    serialNumber: json["serial_number"],
    videoId: json["video_id"],
    instructorword: json["instructorword"],
    resource: json["resource"],
    assignment: json["assignment"],
    whichCourse: json["which_course"],
    whichChapter: json["which_chapter"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "serial_number": serialNumber,
    "video_id": videoId,
    "instructorword": instructorword,
    "resource": resource,
    "assignment": assignment,
    "which_course": whichCourse,
    "which_chapter": whichChapter,
  };
}
