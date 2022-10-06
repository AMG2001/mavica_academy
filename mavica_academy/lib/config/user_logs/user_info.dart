import 'package:shared_preferences/shared_preferences.dart';

class UserLogs {
  /**
   *  The data that we need from the user are :
   * 1. his name 
   * 2. his email
   * 3. his accountImageUrl .
   */
  static late SharedPreferences userNameSharedPref,
      emailSharedPref,
      photoUrlSharedPref;
  static late String userNameString, emailString, photoUrlString;

  static Future<void> init() async {
    userNameSharedPref = await SharedPreferences.getInstance();
    emailSharedPref = await SharedPreferences.getInstance();
    photoUrlSharedPref = await SharedPreferences.getInstance();
    if (userNameSharedPref.getString("userName") == null) {
    } else {
      userNameString = userNameSharedPref.getString("userName")!;
      emailString = emailSharedPref.getString("email")!;
      photoUrlString = photoUrlSharedPref.getString("photoUrl")!;
    }
  }

  static Future<void> settingUserInfo(
      {required String userName,
      required String email,
      required String photoUrl}) async {
    await userNameSharedPref.setString("userName", userName).then((value) {
      userNameString = userName;
    });
    await emailSharedPref.setString("email", email).then((value) => emailString=email);
    await photoUrlSharedPref.setString("photoUrl", photoUrl).then((value) => photoUrlString = photoUrl);
  }

  String get userName => userNameString;
  String get email => emailString;
  String get photoUrl => photoUrlString;
}
