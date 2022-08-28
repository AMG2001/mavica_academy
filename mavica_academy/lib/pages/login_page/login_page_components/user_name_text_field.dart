import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';
import 'package:mavica_academy/pages/login_page/login_page_components/password_tf_controller.dart';
import 'package:mavica_academy/pages/login_page/login_page_components/user_name_tf_controller.dart';

class UserNameTextField extends StatelessWidget {
  UserNameTextField({
    Key? key,
    required this.userNameTextEditingController,
  }) : super(key: key);

  final TextEditingController userNameTextEditingController;
  UserNameTFController userNameController = Get.put(UserNameTFController());
  PasswordTFController passowrdController = Get.put(PasswordTFController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserNameTFController>(builder: (controller) {
      return Container(
        padding: EdgeInsets.symmetric(
            vertical: 16, horizontal: MediaQuery.of(context).size.width * .05),
        width: MediaQuery.of(context).size.width,
        /**
             * User Name Text Field
             */
        child: TextFormField(
          controller: userNameTextEditingController,
          onEditingComplete: () {
            controller.changeLabelColorToLeave();
          },
          onTap: () {
            controller.changeLabelColorToFocus();
            passowrdController.changeLabelColorToLeave();
          },
          cursorColor: DefaultColors.defaultRed,
          decoration: InputDecoration(
            prefixIcon: Padding(
                padding: EdgeInsets.all(16),
                child: FaIcon(
                  FontAwesomeIcons.user,
                  color: userNameController.labelColor,
                )),
            labelText: "UserName",
            labelStyle: TextStyle(color: controller.labelColor),
            focusColor: DefaultColors.defaultRed,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: DefaultColors.defaultRed),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );
    });
  }
}
