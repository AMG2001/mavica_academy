import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';
import 'package:mavica_academy/config/application_configs/pages_names/pages_names.dart';
import 'package:mavica_academy/widgets/alerts/alerts.dart';

class SignInWithEmailAndPassword {
  BuildContext context;
  SignInWithEmailAndPassword({required this.context});
  Future<void> signIn(String email, String password) async {
    try {
      /**
       * show loading Indicator
       */
      print("Show loading animation");
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(color: DefaultColors.defaultRed),
            );
          });
      /**
           * sign in Function
           */
      print("Sign in operation start .");
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print("sign in operation done successfully .");
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              Future.delayed(Duration(seconds: 3), () {
                /**
               * after showing animation , move to home page
               */
                Get.offNamed(PagesNames.homePageScreenName);
              });
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Lottie.asset(
                    "assets/animated_vectors/process_success_animation.json"),
              );
            });
      });
    } on FirebaseAuthException catch (e) {
      print("there is an error");
      if (e.code == 'user-not-found') {
        await Alerts().showToast('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        await Alerts().showToast('Wrong password provided for that user.');
      }
    }
  }
}
