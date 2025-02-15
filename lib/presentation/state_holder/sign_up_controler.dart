import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Data/models/user_model.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool isLoading = false;

  Future<void> signUp(File? imageFile) async {
    try {
      isLoading = true;
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      String imageUrl = '';
      if (imageFile != null) {
        TaskSnapshot snapshot = await _storage
            .ref('profile_pictures/${userCredential.user!.uid}')
            .putFile(imageFile);
        imageUrl = await snapshot.ref.getDownloadURL();
      }
      UserModel user = UserModel(
        id: userCredential.user!.uid,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        mobile: phoneController.text.trim(),
        profileImageUrl: imageUrl,
      );
      await _firestore.collection('users').doc(user.id).set(user.toJson());
      isLoading = false;
      Get.snackbar('Success', 'Account created successfully');
    } catch (e) {
      isLoading = false;
      Get.snackbar('Error', e.toString());
    }
  }
}
