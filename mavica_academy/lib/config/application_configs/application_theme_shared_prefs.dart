import 'package:shared_preferences/shared_preferences.dart';

class ApplicationThemeSharedPref {
  /**
   * Shared pref Obj
   */
  static late SharedPreferences _darkModeSharedPreference;

  static Future<void> initializeDarkModeSharedPref() async {
    await SharedPreferences.getInstance().then((value) {
      _darkModeSharedPreference = value;
      _darkModeSharedPreference.setBool("isDark", false);
      print("Dark mode Shared Pref instance created Successfully ##");
    });
  }

  /**
   * Save new Shared Pref value
   */
  static Future<void> saveDarkModeValue(bool val) async {
    await _darkModeSharedPreference.setBool('darkMode', val);
  }

  static bool getDarkModeValue() {
    return _darkModeSharedPreference.getBool('darkMode') ?? false;
  }
}
