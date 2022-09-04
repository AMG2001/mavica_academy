import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mavica_academy/config/user_logs/user_logged_controller.dart';

class FacebookAuthController extends GetxController {
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<void> signOutFromFacebook() async {
    /**
     * to sign out from Firebase 
     */
    await FirebaseAuth.instance.signOut();
    /**
     * to Sign out from Google account
     */
    await GoogleSignIn().signOut();
    /**
     * Facebook Sign out .
     */
    await FacebookAuth.instance.logOut();
/**
 * change user logging SharedPref
 */
       await UserLoggedController.logoutUser();
  }
}
