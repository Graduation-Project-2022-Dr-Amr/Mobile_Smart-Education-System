import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  ////////دي عشان لما تغير المود وتحفظه لما تخرج من البرنامج////
  static Future<bool> setBool(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getBool({required String key}) {
    return sharedPreferences.getBool(key);
  }

/////////دي عشان لما تغير اتجاه البرنامج وتحفظه لما تخرج وتدخل للبرنامج////
  static Future<bool> setBoolRtl(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getBoolRtl({required String key}) {
    return sharedPreferences.getBool(key);
  }
}
