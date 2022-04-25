// import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// class ThemeServices {
//   final GetStorage _box = GetStorage();
//   final String _key = 'isDarkMode';
//
//   _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
//
//   bool _loadThemeFromBox() => _box.read(_key) ?? false;
//
//   ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
//
//   void switchTheme() {
//     Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
//     _saveThemeToBox(!_loadThemeFromBox());
//   }
//
//   final String _key2 = 'isFirstTime';
//
//   saveFirstTime(bool isFirstTime) => _box.write(_key2, isFirstTime);
//
//   bool get loadIsFirstFromBox => _box.read(_key2) ?? false;
//
//   /// by SharedPreferences
// /*bool isDarkMode = false;
//
//   _saveThemeToPref(bool isDark) async {
//     final _pref = await SharedPreferences.getInstance();
//     _pref.setBool(_key, isDark);
//   }
//
//   void switchThemeByPref() async {
//     isDarkMode = !isDarkMode;
//     _saveThemeToPref(isDarkMode);
//   }
//
//    Future<ThemeMode> get themeFromPref async {
//     final _pref = await SharedPreferences.getInstance();
//     bool isDark = _pref.getBool(_key) ?? false;
//     if (isDark) {
//       return ThemeMode.dark;
//     } else {
//       return ThemeMode.light;
//     }
//   }*/
// }
