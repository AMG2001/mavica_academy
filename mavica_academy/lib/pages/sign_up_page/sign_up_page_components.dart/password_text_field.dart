import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/pages/sign_up_page/sing_up_page_controller.dart';

class PasswordTF extends StatelessWidget {
  const PasswordTF({
    Key? key,
    required this.passwordController,
    required this.signUpPageController,
  }) : super(key: key);

  final TextEditingController passwordController;
  final SignUpPageController signUpPageController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpPageController>(builder: (controller) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          validator: (value) {
            if (value == "" || value == null) {
              return "You can't leave password empty";
            } else if (value.length < 8) {
              return "Password must be 8 or more !!";
            }
          },
          controller: passwordController,
          obscureText: signUpPageController.securePassword,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: signUpPageController.eyeIcon,
                  onPressed: () {
                    signUpPageController
                        .changeShowPasswordValue();
                  }),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FaIcon(FontAwesomeIcons.shieldHalved),
              ),
              hintText: "enter your password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              )),
        ),
      );
    });
  }
}
