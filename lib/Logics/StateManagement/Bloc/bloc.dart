import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_education/NavigationBar_Screens/coursesscreen.dart';
import 'package:smart_education/NavigationBar_Screens/homescreen.dart';
import 'package:smart_education/NavigationBar_Screens/leaderboard_screen.dart';
import 'package:smart_education/NavigationBar_Screens/communityscreen.dart';
import 'package:smart_education/data/api/api_constants.dart';
import 'package:smart_education/data/models/lessons.dart';
import 'package:smart_education/data/repository/app_repository.dart';
import 'package:smart_education/shared/network/Local%20Network/SharedPreferances/cashe_helper.dart';
import 'bloc_states.dart';
import 'package:smart_education/NavigationBar_Screens/profilescreen.dart';

class Mybloc extends Cubit<AppStates> {
  Mybloc() : super(AppInitialState());

  static Mybloc get(context) => BlocProvider.of(context);

  bool isLast = false;
  int pageIndex = 0;
  int selectedIndex = 0;
  String? keyWord;
  bool isDark = false;
  bool isRtl = true;
  bool isObsecure = true;
  bool isInstructor = true;
  bool isChecked = false;
  IconData suffixIcon = Icons.remove_red_eye_outlined;

  List<Lesson> searchedLessons = [];
  List<Lesson> generalLessons = [];

//تحط هنا الاسكرينات اللي عندك  في التطبيق عشان لو هتستخدمهم  في ال BottomNavigationBar
  List<Widget> screens = [
    HomeScreen(),
    CoursesScreen(),
    CommunityScreen(),
    LeaderBoard(),
    ProfileScreen(),
  ];

  List<BottomNavigationBarItem> bottomItemsArabic = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        size: 24,
      ),
      label: 'الرئيسية',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.menu_book,
        size: 24,
      ),
      label: 'الكورسات',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.people,
      ),
      label: 'المجتمع',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.leaderboard_outlined,
      ),
      label: 'المعلم',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.menu_outlined,
      ),
      label: 'المزيد',
    ),
  ];

  List<BottomNavigationBarItem> bottomItemsEnglish = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        size: 24,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.menu_book,
        size: 24,
      ),
      label: 'Courses',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.people,
      ),
      label: 'Community',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.leaderboard_outlined,
      ),
      label: 'Leaderboard',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.menu_outlined,
      ),
      label: 'More',
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

  void changeRole() {
    isInstructor = !isInstructor;
    emit(ChangeRoleColorState());
  }

  void changeCheckBox() {
    isChecked = !isChecked;
    emit(ChangeCheckBoxState());
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
    selectedIndex = index;
    emit(AppBottomNavState());
  }

  void changeSuffexIcon() {
    isObsecure = !isObsecure;
    suffixIcon =
        isObsecure ? Icons.remove_red_eye_outlined : Icons.visibility_off;
    emit(SuffixIconState());
  }
}
