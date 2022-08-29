import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
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
