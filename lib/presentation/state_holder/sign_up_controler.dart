import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../ui/widgets/toast.dart';
import '../ui/screens/Auth/pin_code_verification.dart';
import '../ui/screens/Auth/sign_in_screen.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  var isSigningUp = false.obs;

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  void signUp() async {
    isSigningUp(true);

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String phone = phoneController.text.trim();

    try {
      // Create user with email & password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Verify phone number
      _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await userCredential.user?.updatePhoneNumber(credential);
          showToast(message: "Phone number verified");
        },
        verificationFailed: (FirebaseAuthException e) {
          showToast(message: "Phone verification failed: ${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) {
          Get.to(() => PinVerificationScreen());
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

      isSigningUp(false);
      showToast(message: "User successfully created. Please verify your phone.");
      Get.to(SignInScreen());
    } catch (e) {
      isSigningUp(false);
      showToast(message: "Some error occurred: $e");
    }
  }
}
