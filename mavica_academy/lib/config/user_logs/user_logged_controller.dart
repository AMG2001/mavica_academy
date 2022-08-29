import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoggedController extends GetxController {
   static bool userLoggedBool = false;
   static late SharedPreferences userLoggedSharedPref;

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

  static Future<void> loggingUser() async {
    await userLoggedSharedPref.setBool("userLogged", true).then((value) => userLoggedBool=true);
  }

   static bool getUserLoggedBool() {
    return userLoggedBool;
  }
}
