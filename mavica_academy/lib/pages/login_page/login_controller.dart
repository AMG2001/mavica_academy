import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool showColumnBool = false;
  void changeShowColumnBool() {
    showColumnBool = true;
    update();
  }

  Widget showColumn(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .25,
          ),
          Text(
            "GoLearn",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Text("To be one of our Community just"),
          Text("Login")
        ],
      ),
    );
  }
}
