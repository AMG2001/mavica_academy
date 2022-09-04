import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/config/application_configs/pages_names/pages_names.dart';
import 'package:mavica_academy/config/user_logs/user_info.dart';
import 'package:mavica_academy/config/user_logs/user_logged_controller.dart';
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              /**
               * main Column
               */
              child: Form(
                key: sigUpFormState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /**
                     * GoLearn Logo
                     */
                    Align(
                        alignment: Alignment.center,
                        child: Lottie.asset(
                            "assets/animated_vectors/sign_up_animation.json",
                            width: MediaQuery.of(context).size.width * .8,
                            height: MediaQuery.of(context).size.height * .4)),
                    /**
                     * Welcome message
                     */
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Welcome Between GoLearn Family",
                        style: ThemeData.light().textTheme.headline2,
                      ),
                    ),
                    /**
                     * Sign up now message
                     */
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Text(
                      "Sign up ",
                      style: TextStyle(
                          fontSize: 24, color: DefaultColors.defaultRed),
                    ),

                    /**
                         * Row of first and last name
                         */
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /**
                         * First Name TF Column
                         */
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("First Name"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .425,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == "" || value == null) {
                                    return "You can't leave it empty";
                                  }
                                },
                                controller: firstNameController,
                                decoration: InputDecoration(
                                    hintText: "enter first name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                              ),
                            )
                          ],
                        ),
                        /**
                         * Last Name TF Column
                         */
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Last Name"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .425,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == "" || value == null) {
                                    return "You can't leave it empty";
                                  }
                                },
                                controller: lastNameController,
                                decoration: InputDecoration(
                                    hintText: "enter last name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    /**
                     * email TF
                     */
                    Text("Email"),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        validator: (value) {
                          if (value == "" || value == null) {
                            return "You can't leave email empty";
                          } else if (RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value) ==
                              false) {
                            return "This is not an email !!";
                          }
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                                padding: EdgeInsets.all(16),
                                child: FaIcon(FontAwesomeIcons.user)),
                            hintText: "enter your email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                      ),
                    ),
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
                    GetBuilder<SignUpPageController>(builder: (controller) {
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
                    }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Sign up"),
                            SizedBox(
                              width: 10,
                            ),
                            FaIcon(
                              FontAwesomeIcons.arrowRight,
                              size: 16,
                            )
                          ],
                        ),
                        onPressed: () async {
                          if (sigUpFormState.currentState!.validate()) {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) async {
                              String userName =
                                  "${firstNameController.text} ${lastNameController.text}";
                              await UserLogs.settingUserInfo(
                                      userName: userName,
                                      email: emailController.text,
                                      photoUrl:
                                          "https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg")
                                  .then((value) async {
                                await UserLoggedController.loggingUser().then(
                                    (value) => Get.offNamed(
                                        ConstantPagesName.homePageScreenName));
                              });
                            });
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
