
import 'video.dart';
class ChapterWithVideos {
  ChapterWithVideos({
    required this.id,
    required this.chapterName,
    required this.serialNumber,
    required this.course,
    required this.videos,
  });

  int id;
  String chapterName;
  int serialNumber;
  int course;
  List<Video> videos;

// factory ChapterWithVideos.fromJson(Map<String, dynamic> json) => ChapterWithVideos(
//   id: json["id"],
//   chapterName: json["chapter_name"],
//   serialNumber: json["serial_number"],
//   course: json["course"],
//   videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
// );
//
// Map<String, dynamic> toJson() => {
//   "id": id,
//   "chapter_name": chapterName,
//   "serial_number": serialNumber,
//   "course": course,
//   "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
// };
}
