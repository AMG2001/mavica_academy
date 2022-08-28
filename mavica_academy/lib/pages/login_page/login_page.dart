import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/pages/login_page/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("assets/application/login.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(.3), BlendMode.darken),
                ),
              ),
              child: Stack(
                children: [
                  controller.showColumnBool == true
                      ? controller.showColumn(context)
                      : Text(""),
                  // AnimatedPositioned(
                  //   onEnd: () => controller.changeShowColumnBool(),
                  //   left: MediaQuery.of(context).size.width * .35,
                  //   width: 150,
                  //   height: 150,
                  //   duration: Duration(milliseconds: 4000),
                  //   top: MediaQuery.of(context).size.height * .05,
                  //   curve: Curves.easeInOut,
                  //   child: Image(
                  //     image: AssetImage('assets/application/GoLearn_logo.png'),
                  //   ),
                  // ),
                  FadeAnimations
                ],
              ),
            );
          }),
    );
  }
}
