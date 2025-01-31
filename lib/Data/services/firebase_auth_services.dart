import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../presentation/ui/screens/Auth/pin_code_verification.dart';
import '../../presentation/ui/screens/Auth/reset_password.dart';
import '../../presentation/ui/widgets/toast.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Sign up with email and phone (User enters OTP separately)
  Future<User?> signUpWithEmailAndPhone(String email, String password, String phoneNumber) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _sendOtp(phoneNumber);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      showToast(message: 'An error occurred: ${e.code}');
    }
    return null;
  }

  /// Sign in with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      showToast(message: 'Invalid credentials: ${e.code}');
    }
    return null;
  }

  /// Send OTP for phone authentication
  Future<void> _sendOtp(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        showToast(message: 'Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.to(() => PinVerificationScreen());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  /// Sign in with phone number (OTP-based)
  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    await _sendOtp(phoneNumber);
  }

  /// Verify OTP and sign in
  Future<User?> verifyOtp(String verificationId, String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      showToast(message: 'Failed to verify OTP: ${e.message}');
    }
    return null;
  }



  Future<void> sendVerificationEmail(String email) async {
    User? user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      showToast(message: 'Verification email sent');
    } else if (user != null && user.emailVerified) {
      // Email already verified, direct to reset password screen
      Get.to(() => const ResetPasswordScreen());
    } else {
      throw Exception('No user is logged in');
    }
  }

  /// Check email verification status
  Future<void> checkEmailVerification() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await user.reload();
      if (user.emailVerified) {
        // If email is verified, navigate to ResetPasswordScreen
        Get.to(() => const ResetPasswordScreen());
      } else {
        showToast(message: 'Please verify your email first');
      }
    }
  }


}









