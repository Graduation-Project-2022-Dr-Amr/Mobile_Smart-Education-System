import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartEdu/NavigationBar_Screens/coursesscreen.dart';
import 'package:smartEdu/NavigationBar_Screens/homescreen.dart';
import 'package:smartEdu/NavigationBar_Screens/leaderboard_screen.dart';
import 'package:smartEdu/NavigationBar_Screens/communityscreen.dart';
import 'package:smartEdu/data/api/cacheHelper.dart';
import 'bloc_states.dart';
import 'package:smartEdu/NavigationBar_Screens/profilescreen.dart';

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
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
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
      CacheHelper.saveData(key: 'isRtl', value: isRtl).then((value) {
        emit(AppChangeDirectionState());
      });
    }
  }

  void changeBottomNavBar(int index) {
    selectedIndex = index;
    emit(AppBottomNavState());
  }

  bool showPassword = false;
}
