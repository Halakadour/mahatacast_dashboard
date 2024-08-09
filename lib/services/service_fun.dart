
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceFunctions {
  static Future<void> setUserToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<String?> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    print(token);
    return token;
  }

  static Future<void> deleteUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  static void setLangauge(String lan) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lan', lan);
  }

  static Future<String?> getLangauge() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? lan = prefs.getString('lan');
    print(lan);
    return lan;
  }
}
