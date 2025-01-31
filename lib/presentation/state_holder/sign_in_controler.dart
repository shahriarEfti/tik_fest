import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tik_fest/Data/services/firebase_auth_services.dart';
import 'package:tik_fest/presentation/ui/screens/home_screen.dart';

import '../ui/screens/Auth/email_varification_screen.dart';
import '../ui/screens/utility/app_constants.dart';
import '../ui/widgets/toast.dart';

class SignInController extends GetxController {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var isSigning = false.obs;

  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    emailOrPhoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> signIn() async {
    isSigning.value = true;

    String input = emailOrPhoneController.text.trim();
    String password = passwordController.text.trim();

    if (AppConstants.emailRegExp.hasMatch(input)) {
      // If input is an email, sign in with email and password
      User? user = await _auth.signInWithEmailAndPassword(input, password);

      if (user != null) {
        showToast(message: "User successfully signed in");
        Get.to(HomeScreen());
      } else {
        showToast(message: "Invalid credentials");
      }
    } else if (AppConstants.phoneRegExp.hasMatch(input)) {
      // If input is a phone number, navigate to phone verification screen
      await _auth.signInWithPhoneNumber(input); // Trigger OTP for phone number verification
    } else {
      showToast(message: "Invalid email or phone number");
    }

    isSigning.value = false;
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        showToast(message: "Google Sign-In successful");
        Get.to(HomeScreen());
      } else {
        showToast(message: "Google Sign-In canceled");
      }
    } catch (e) {
      showToast(message: "Some error occurred: $e");
    }
  }
}
