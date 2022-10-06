import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoggedController extends GetxController {
  static bool userLoggedBool = false;
  static late SharedPreferences userLoggedSharedPref;

/**
 * getInstance of  UserLogged SharedPref , 
 * if it's value is null or false , that mean it's user not logged in yet .
 * os open app on LoginPage()
 * if it's value is ture ,that mean user logged in 
 * and make application open on HomePage() Directly .
 */
  static Future<void> init() async {
    userLoggedSharedPref = await SharedPreferences.getInstance();
    if (userLoggedSharedPref.getBool("userLogged") == null) {
      await userLoggedSharedPref.setBool("userLogged", false).then((value) {
        userLoggedBool = false;
      });
    } else {
      userLoggedBool = userLoggedSharedPref.getBool("userLogged")!;
    }
  }

/**
 * To logOut user from the app and make Logged SharedPref Value  = false .
 */
  static Future<void> logoutUser() async{
    await userLoggedSharedPref
        .setBool("userLogged", false)
        .then((value) => userLoggedBool = false);
  }
  /**
   * Logging User in .
   */
  static Future<void> loggingUser() async {
    await userLoggedSharedPref
        .setBool("userLogged", true)
        .then((value) => userLoggedBool = true);
  }

  static bool getUserLoggedBool() {
    return userLoggedBool;
  }
}
