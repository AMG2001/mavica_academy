import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'application_theme_state.dart';

class ApplicationThemeCubit extends Cubit<ApplicationThemeState> {
  /**
   * class Constructor
   */
  ApplicationThemeCubit() : super(ApplicationThemeCubitInitialState());
  /**
   * Obj that will store theme state of application
   */
  static late SharedPreferences darkModeSharedPref;
/**
 * setter function of theme SharedPref value
 */
  Future<void> setDarkModeValue(bool val) async {
    darkModeSharedPref = await SharedPreferences.getInstance();
    darkModeSharedPref.setBool('darkMode', val);
    print("value of darkMode is ${darkModeSharedPref.getBool("darkMode")}");
  }

  /**
   * getter function that return stored value in theme SharedPref
   */
  Future<bool?> getDarkModeValue() async {
    darkModeSharedPref = await SharedPreferences.getInstance();
    return darkModeSharedPref.getBool('darkMode');
  }

  /**
   * This boolean value is come from switch in settings page.
   */

}
