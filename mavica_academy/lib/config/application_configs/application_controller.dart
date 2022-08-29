// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ApplicationController extends GetxController {
//   bool userLoggedBool = false;
//   late SharedPreferences userLoggedSharedPref;

//   Future<void> userLoggedInit() async {
//     userLoggedSharedPref = await SharedPreferences.getInstance();
//     if (userLoggedSharedPref.getBool("userLogged") == null) {
//       await userLoggedSharedPref.setBool("userLogged", false).then((value) {
//         userLoggedBool = false;
//       });
//     } else {
//       userLoggedBool = true;
//     }
//   }

//   Future<void> userLoggedSuccessfully() async {
//     await userLoggedSharedPref.setBool("userLogged", true).then((value) {
//       userLoggedBool = true;
//     });
//   }
// }
