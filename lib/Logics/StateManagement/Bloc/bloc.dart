import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../API/api/cacheHelper.dart';
import '../../../l10n/l10n.dart';
import '../../../presentation/NavigationBar_Screens/Community Screens/community_screen.dart';
import '../../../presentation/NavigationBar_Screens/Courses Screens/courses_screen.dart';
import '../../../presentation/NavigationBar_Screens/Home Screens/home_screen.dart';
import '../../../presentation/NavigationBar_Screens/LeaderBoard Screens/leaderboard_screen.dart';
import '../../../presentation/NavigationBar_Screens/More Screens/more_screen.dart';
import 'bloc_states.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Mybloc extends Cubit<AppStates> {
  Mybloc() : super(AppInitialState());

  static Mybloc get(context) => BlocProvider.of(context);

  Locale? _locale;

  Locale get locale => _locale??Locale('en');

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    emit(SetLocalLangState());
  }

  void clearLocale() {
    _locale = null;
    emit(ClearLocalLangState());
  }

  bool isLast = false;
  int pageIndex = 0;
  int selectedIndex = 0;
  String? keyWord;
  bool isDark = false;
  bool isRtl = true;
  bool isObsecure = true;
  String? darkModeRadio = '';
  String? languageValue='';
  Color borderColor = Colors.grey.shade300;
  Color? textFieldColor = Colors.grey[300];
  Color? myMessageColor = Colors.blueAccent;
  Color? messageColor = Colors.grey[300];
  Color? unreadMessage = Colors.grey[300];
  Color textColor = Colors.black;
  Color backgroundColor = Colors.white;
  IconData? icon = Icons.brightness_4_outlined;
  ThemeMode appMode = ThemeMode.light;
  changeActiveRadio(value) {
    value = darkModeRadio;
    emit(ChangeActiveRadio());
  }

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
        print('Change Mode Cache Saved');
      }
      if (isDark) {
        if (kDebugMode) {
          print('Change Mode is Now Dark mode');
        }
        appMode = ThemeMode.dark;
        darkModeRadio = 'On';

        emit(ChangeModeState());
      } else {
        if (kDebugMode) {
          print('Change Mode is Now light mode');
        }
        appMode = ThemeMode.light;
        darkModeRadio = 'Off';
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



  void changeBottomNavBar(int index) {
    selectedIndex = index;
    emit(AppBottomNavState());
  }

  bool showPassword = false;
}
