import 'package:shared_preferences/shared_preferences.dart';

class PostIdSharedPref {
  late SharedPreferences postIdSharedPref;

  void init() async {
    if (postIdSharedPref.getInt('postId') == null) {
      postIdSharedPref.setInt('postId', 0);
    }
  }
}
