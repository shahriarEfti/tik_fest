import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import '../../Data/services/firebase_auth_services.dart';
import '../ui/screens/home_screen.dart';

class SignInController extends GetxController {
  final FirebaseAuthServices _authService = FirebaseAuthServices();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isLoading = false;

  Future<void> signIn(String email, String password) async {
    try {
      isLoading = true;

      final user = await _authService.signInWithEmailAndPassword(email, password);

      if (user != null) {
        Get.snackbar('Welcome', 'Sccessfully SignIn');
        Get.to(HomeScreen());
      } else {
        isLoading = false;
        Get.snackbar('Error', 'Incorrect password or email');
      }
    } catch (e) {
      isLoading = false;
      Get.snackbar('Error', 'Incorrect password or email');
    }
  }
}
