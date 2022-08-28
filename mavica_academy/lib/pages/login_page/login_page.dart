import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';
import 'package:mavica_academy/pages/login_page/login_page_components/login_page_header_image.dart';
import 'package:mavica_academy/pages/login_page/login_page_components/login_page_theme_button.dart';
import 'package:mavica_academy/pages/login_page/login_page_components/password_text_field.dart';
import 'package:mavica_academy/pages/login_page/login_page_components/user_name_text_field.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height,
            child: Expanded(
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   /**
                  //    * Login Page Theme Button
                  //    */
                  //   child: LoginPageThemeButton(),
                  // ),
                  /**
                   * Container that contain login apge header image
                   */
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .04,
                  ),
                  LoginPageHeaderImage(),

                  /**
                   * Contaienr that hold 2TF and login button
                   */
                  Form(
                    key: loginKey,
                    child: Column(
                      children: [
                        /**
                         * Login Now Text
                         */
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),
                        Text(
                          "Login Now",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .02),
                        /**
                                 * Description Text
                                 */
                        Text(
                          "Please enter the details below to continue.",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        /***
                         * User Name Text Field
                         */
                        UserNameTextField(
                            userNameTextEditingController:
                                userNameTextEditingController),
                        /**
                                 * Password Text Field
                                 */
                        PasswordTextField(
                            passwordTextEditingController:
                                passwordTextEditingController),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlinedButton(
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all<BorderSide>(
                                      BorderSide(
                                          color: DefaultColors.defaultRed)),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color:
                                                      DefaultColors.defaultRed),
                                              borderRadius:
                                                  BorderRadius.circular(28))),
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Register    ",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.arrowRight,
                                      size: 12,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: DefaultColors.defaultRed,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .8,
                          child: Column(
                            children: [
                              /**
                               * Signin with Google button
                               */
                              ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(28))),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white)),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .12,
                                      ),
                                      Image(
                                        width: 38,
                                        height: 38,
                                        image: AssetImage(
                                            "assets/icons/google.png"),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .05,
                                      ),
                                      Text(
                                        "Sign with Google",
                                        style: TextStyle(color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              /**
                               * Signin with Facebook
                               */
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(28))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color(0xFF1877F2),
                                  ),
                                ),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .12,
                                      ),
                                      Image(
                                        width: 38,
                                        height: 38,
                                        image: AssetImage(
                                            "assets/icons/facebook.png"),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .05,
                                      ),
                                      Text(
                                        "Sign with Facebook",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              /**
                               * login Anonymous
                               */
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(28))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          DefaultColors.defaultRed),
                                ),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Sign in",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
