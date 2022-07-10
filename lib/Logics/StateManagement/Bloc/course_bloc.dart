import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_education/data/Models/chapter.dart';
import 'package:smart_education/data/Models/chapters_with_videos.dart';
import 'package:smart_education/data/Models/course.dart';
import 'package:smart_education/data/Models/student_register_model.dart';
import 'package:smart_education/data/Models/video.dart';
import 'package:smart_education/data/api/dio_helper.dart';
import 'package:smart_education/data/api/endPoints.dart';
import 'bloc_states.dart';

class CourseBloc extends Cubit<AppStates> {
  CourseBloc() : super(AppInitialState());

  static CourseBloc get(context) => BlocProvider.of(context);

  List<Course> allCourses = [];
 void getAllCourses(){
   DioHelper.getData(url: courses,token: "87bbba43d275f6c5746ad900a2254b23e01e630d").then((value) {
     print("this is important course ${value.data} and type ${value.data.runtimeType}");
     allCourses = courseFromJson(value.data);

     if (kDebugMode ) {
       print('============Course Information=================================');
       for (var element in allCourses) {print("Course  $element");}
     }
     emit(CourseSuccessState());
   }).catchError((error) {
     emit(CourseErrorState());
     if (kDebugMode) {
       print('=======================================');
       print('Error in getAllCourses METHOD: ${error.toString()}');
       print('=======================================');
     }
   });
 }

  List<Chapter> allChapters = [];
  List<Chapter> courseChapters = [];

  // List<ChapterWithVideos> allCourseChaptersWithVideos = [];
  // List<ChapterWithVideos> courseChaptersWithVideos = [];
  //
  // List<Video> chapterVideos = [];

  void getAllChapters({required List<Video> courseVideos,required int courseId}) async{
   await DioHelper.getData(url: chapters, token: "87bbba43d275f6c5746ad900a2254b23e01e630d").then((value) {
     print("this is important chapter ${value.data} and type ${value.data.runtimeType}");

     allChapters = chapterFromJson(value.data);

     if (kDebugMode ) {
       print('============Chapters Information=================================');
       for (var element in allChapters) {print("chapter  $element");}
     }

     for (var chapter in allChapters) {
       if(chapter.course == courseId){
         int isExist = courseChapters.indexWhere((element) => element.id == chapter.id);
         if(isExist < 0){
           courseChapters.add(chapter);
         }
       }
     }
     for (var element in courseChapters) {print("courseChapters  $element");}

     // for (var video in courseVideos) {
       //   if(chapter.id == video.whichChapter){
       //     // int isExist = chapterVideos.indexWhere((element) => element.id == video.id);
       //     // if(isExist < 0){
       //     //   print("video.id ${video.id}");
       //       int isExist = courseChaptersWithVideos.indexWhere((element) => element.id == chapter.id);
       //       if(isExist < 0){
       //         courseChaptersWithVideos.add(ChapterWithVideos(
       //             id: chapter.id,
       //             chapterName: chapter.title,
       //             serialNumber: chapter.serialNumber,
       //             course: chapter.whichCourse,
       //             videos: [video],
       //             ));
       //       }else{
       //         int isExistVideo = courseChaptersWithVideos.indexWhere((element) => element.id == chapter.id);
       //         ChapterWithVideos c = courseChaptersWithVideos.firstWhere((element) => element.id == chapter.id);
       //         int i = courseChaptersWithVideos.indexOf(c);
       //         courseChaptersWithVideos[i].videos
       //       }
       //       // chapterVideos.add(Video(id: video.id,
       //       //     title: video.title,
       //       //     serialNumber: video.serialNumber,
       //       //     videoId: video.videoId,
       //       //     instructorword: video.instructorword,
       //       //     resource: video.resource,
       //       //     assignment: video.assignment,
       //       //     whichCourse: video.whichCourse,
       //       //     whichChapter: video.whichChapter));
       //    // }
       //   }
       // }

       // for (var video in courseVideos) {
       //   int isExist = courseChaptersWithVideos.indexWhere((element) => element.id == chapter.id);
       //   if(isExist < 0){
       //     courseChaptersWithVideos.add(ChapterWithVideos(id: chapter.id, chapterName: chapter.title, serialNumber: chapter.serialNumber, course: chapter.whichCourse, videos: ));
       //   }
       // }



    // allCourseChaptersWithVideos.addAll(ChapterWithVideos())




     //int isExist = allCourseChaptersWithVideos.indexWhere((element) => element.id == chapter.id);


     //
     // for (var element in courseChapters) {
     //   getAllVideos(chapterId: element.id);
     //
     //   print("course $courseId  $element");
     // }


     emit(ChapterSuccessState());


   }).catchError((error) {
     emit(ChapterErrorState());
     if (kDebugMode) {
       print('=======================================');
       print('Error in getAllChapters METHOD: ${error.toString()}');
       print('=======================================');
     }
   });
 }

  List<Video> getChapterVideos({videos, chapter}){
   List<Video> cv = [];
   for(var video in videos){
     if(chapter.id == video.whichChapter){
       int isExist = cv.indexWhere((element) => element.id == video.id);
       if(isExist <0){
         cv.add(video);
       }
     }
   }
   return cv;
 }


  List<Video> allVideos = [];
  List<Video> courseVideos = [];

  void getAllVideos({courseId}) async{
    await DioHelper.getData(url: videos,token: "87bbba43d275f6c5746ad900a2254b23e01e630d").then((value) {
      print("this is important course ${value.data} and type ${value.data.runtimeType}");

      allVideos = videoFromJson(value.data);
      //allVideos = value.data;

      if (kDebugMode ) {
        print('============Videos Information=================================');
        //for (var element in allVideos) {print("video  $element");}
      }

      for (var video in allVideos) {
        if(video.whichCourse == courseId){
          int isExist = courseVideos.indexWhere((element) => element.id == video.id);
          if(isExist < 0){
            courseVideos.add(video);
          }
        }

      }


      emit(VideoSuccessState());
    }).catchError((error) {
      emit(VideoErrorState());
      if (kDebugMode) {
        print('=======================================');
        print('Error in getAllVideos METHOD: ${error.toString()}');
        print('=======================================');
      }
    });

    getAllChapters(courseVideos: courseVideos, courseId: courseId);

  }

////////////////////////////////////////////////////////////////////////////////
}
