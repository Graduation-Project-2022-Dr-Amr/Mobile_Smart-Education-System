import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_education/NavigationBar_Screens/courses_screen.dart';
import 'package:smart_education/NavigationBar_Screens/home_screen.dart';
import 'package:smart_education/NavigationBar_Screens/leaderboard_screen.dart';
import 'package:smart_education/NavigationBar_Screens/community_screen.dart';
import '../../../API/api/cacheHelper.dart';
import 'bloc_states.dart';
import 'package:smart_education/NavigationBar_Screens/more_screen.dart';

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
  ThemeMode appMode = ThemeMode.light;

  void changeMode({fromCache}) {
    if (fromCache == null) {
      isDark = !isDark;
      emit(ChangeModeState());
    } else {
      isDark = fromCache;
      emit(ChangeModeState());
    }
    CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
      if (kDebugMode) {
        print('cache saved');
      }
      if (isDark) {
        if (kDebugMode) {
          print('dark mode');
        }
        appMode = ThemeMode.dark;
        emit(ChangeModeState());
      } else {
        if (kDebugMode) {
          print('light mode');
        }
        appMode = ThemeMode.light;
        emit(ChangeModeState());
      }
      emit(ChangeModeState());
    });
  }

//تحط هنا الاسكرينات اللي عندك  في التطبيق عشان لو هتستخدمهم  في ال BottomNavigationBar
  List<Widget> screens = [
    HomeScreen(),
    CoursesScreen(),
    CommunityScreen(),
    LeaderBoard(),
    MoreScreen(),
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
      icon: SvgPicture.asset(
        'assets/images/home.svg',
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/images/course.svg'),
      label: 'Courses',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/images/chat.svg'),
      label: 'Community',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/images/leader.svg'),
      label: 'Leaderboard',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/images/more.svg'),
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
