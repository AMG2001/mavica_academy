import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/pages/sign_up_page/sign_up_page_components.dart/email_text_field.dart';
import 'package:mavica_academy/pages/sign_up_page/sign_up_page_components.dart/first_name_text_field.dart';
import 'package:mavica_academy/pages/sign_up_page/sign_up_page_components.dart/last_name_text_field.dart';
import 'package:mavica_academy/pages/sign_up_page/sign_up_page_components.dart/page_header.dart';
import 'package:mavica_academy/pages/sign_up_page/sign_up_page_components.dart/password_text_field.dart';
import 'package:mavica_academy/pages/sign_up_page/sign_up_page_components.dart/sign_up_button.dart';
import 'package:mavica_academy/pages/sign_up_page/sing_up_page_controller.dart';

class SignUpPage extends StatelessWidget {
  final signUpPageController = Get.put(SignUpPageController(), permanent: true);
  GlobalKey<FormState> sigUpFormState = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            /**
             * main Column
             */
            child: GetBuilder<SignUpPageController>(
              init:SignUpPageController() ,
              builder: (controller) {
                return Form(
                  autovalidateMode: controller.validationMode,
                  key: sigUpFormState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /**
                       * Page Header Widget
                       */
                      PageHeader(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /**
                           * First Name TF Column
                           */
                          FirstNameTF(firstNameController: firstNameController),
                          /**
                           * Last Name TF Column
                           */
                          LastNameTF(lastNameController: lastNameController),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      Text("Email"),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
/**
                       * Email TF
                       */
                      EmailTF(emailController: emailController),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      /**
                               * Password TF
                               */

                      Text("Password"),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      PasswordTF(
                          passwordController: passwordController,
                          signUpPageController: signUpPageController),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      SignUpButton(
                          sigUpFormState: sigUpFormState,
                          emailController: emailController,
                          passwordController: passwordController,
                          firstNameController: firstNameController,
                          lastNameController: lastNameController)
                    ],
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
