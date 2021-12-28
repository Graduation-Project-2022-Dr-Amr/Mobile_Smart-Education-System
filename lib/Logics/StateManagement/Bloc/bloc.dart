import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_signin/data/api/api_constants.dart';
import 'package:login_signin/data/models/lessons.dart';
import 'package:login_signin/data/repository/app_repository.dart';
import 'package:login_signin/shared/network/Local%20Network/SharedPreferances/cashe_helper.dart';

import 'bloc_states.dart';

class Mybloc extends Cubit<AppStates> {
  Mybloc() : super(AppInitialState());

  static Mybloc get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  String? keyWord;
  bool isDark = false;

  bool isRtl = true;

  List<Lesson> searchedLessons = [];
  List<Lesson> generalLessons = [];

//تحط هنا الاسكرينات اللي عندك  في التطبيق عشان لو هتستخدمهم  في ال BottomNavigationBar
  List<Widget> screens = [];

  List<BottomNavigationBarItem> bottomItemsArabic = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.feed_outlined,
      ),
      label: 'عاجل',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.computer,
      ),
      label: 'التكنولوجيا',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_baseball_rounded,
      ),
      label: 'الرياضة',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.health_and_safety,
      ),
      label: 'الصحة',
    ),
  ];

  List<BottomNavigationBarItem> bottomItemsEnglish = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.feed_outlined,
      ),
      label: 'Breaking',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.computer,
      ),
      label: 'Technology',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_baseball_rounded,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.health_and_safety,
      ),
      label: 'Health',
    ),
  ];

  //دي عشان لما تغير بين موود ال dark ,light
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CashHelper.setBool(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }

//دي عشان لما تغير اتجاه البرنامج من اليمين للشمال
  void changeAppDirection({bool? fromShared}) {
    if (fromShared != null) {
      isRtl = fromShared;
      emit(AppChangeDirectionState());
    } else {
      isRtl = !isRtl;
      CashHelper.setBoolRtl(key: 'isRtl', value: isRtl).then((value) {
        emit(AppChangeDirectionState());
      });
    }
  }

  void getSearchedLessons(String? keyWord) {
    emit(AppSearchedLoadingState());
    NewsRepository.getSearchedLessons(keyWord!).then((articles) {
      this.keyWord = keyWord;
      setImageIfNull(articles);
      searchedLessons = articles;
      emit(AppSearchedLoadedState());
    }).catchError((error) {
      //print(error.toString());
      emit(AppSearchedErrorState(error.toString()));
    });
  }

  void setImageIfNull(List<Lesson> articles) {
    for (var article in articles) {
      article.urlToImage ??= noImage;
    }
  }

// void setImageIfNull(List<Lesson> articles) {
//   articles.forEach((article) {
//     if (article.urlToImage == null) {
//       article.urlToImage = noImage;
//     }
//   });
// }
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }
}
