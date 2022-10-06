import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';
import 'package:mavica_academy/config/application_configs/pages_names/pages_names.dart';
import 'package:mavica_academy/pages/sign_up_page/sign_up_page.dart';
import 'package:page_transition/page_transition.dart';

class RegisterAndForgetPasswordRow extends StatelessWidget {
  const RegisterAndForgetPasswordRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /**
           * Register Button
           */
          OutlinedButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(color: DefaultColors.defaultRed)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      side: BorderSide(color: DefaultColors.defaultRed),
                      borderRadius: BorderRadius.circular(28))),
            ),
            /**
             * Register Button Function
             */
            onPressed: () {
              Get.toNamed(ConstantPagesName.signUpPage);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Register    ",
                  style: Theme.of(context).textTheme.button,
                ),
                FaIcon(
                  FontAwesomeIcons.arrowRight,
                  size: 12,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Fluttertoast.showToast(
                  msg: "this Function isn't Available now !!",
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: Colors.black);
            },
            child: Text(
              "Forgot Password?",
              style: TextStyle(color: DefaultColors.defaultRed, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
