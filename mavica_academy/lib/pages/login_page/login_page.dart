import 'package:flutter/material.dart';
import 'package:mavica_academy/pages/login_page/login_page_components/login_page_buttons/facebook_login_button.dart';
import 'package:mavica_academy/pages/login_page/login_page_components/login_page_buttons/google_signin_button.dart';
import 'package:mavica_academy/pages/login_page/login_page_components/login_page_buttons/register_and_forget_password_row.dart';
import 'package:mavica_academy/pages/login_page/login_page_components/login_page_buttons/sing_in_button.dart';
import 'package:mavica_academy/pages/login_page/login_page_components/login_page_header_image.dart';
import 'package:mavica_academy/pages/login_page/login_page_components/passwordTextField/password_text_field.dart';
import 'package:mavica_academy/pages/login_page/login_page_components/userNameTextField/user_name_text_field.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
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
                  height: MediaQuery.of(context).size.height * .02,
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
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * .06,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .02),
                      /**
                                 * Description Text
                                 */
                      Text(
                        "Please enter the details below to continue.",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .035,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      /***
                         * User Name Text Field
                         */
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      UserNameTextField(
                          userNameTextEditingController:
                              userNameTextEditingController),
                      /**
                                 * Password Text Field
                                 */
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      PasswordTextField(
                          passwordTextEditingController:
                              passwordTextEditingController),
                      RegisterAndForgetPasswordRow(),
                      Container(
                        width: MediaQuery.of(context).size.width * .8,
                        child: Column(
                          children: [
                            /**
                               * Signin with Google button
                               */
                            GoogleSignInButton(),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * .03,
                            ),
                            /**
                               * Signin with Facebook
                               */
                            FacebookSignInButton(),
                            /**
                               * login Anonymous
                               */
                            SizedBox(
                              height: MediaQuery.of(context).size.width * .03,
                            ),
                            SignInButton(),
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
    );
  }
}



