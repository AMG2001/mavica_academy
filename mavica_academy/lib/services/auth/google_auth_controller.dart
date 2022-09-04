import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mavica_academy/config/user_logs/user_logged_controller.dart';

class GoogleAuthController extends GetxController {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
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
