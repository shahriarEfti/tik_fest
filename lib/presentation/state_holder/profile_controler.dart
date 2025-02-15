import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../Data/models/user_model.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isEditing = false;
  var userModel = UserModel(id: '', name: '', email: '', mobile: '', profileImageUrl: '').obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();  // Ensure data is fetched when the controller is initialized
  }

  Future<void> fetchUserDetails() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
      var userData = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
      userModel.value = userData;
      firstNameController.text = userData.name;
      lastNameController.text = userData.name.split(' ').last;
      mobileController.text = userData.mobile;
    }
  }

  Future<void> updateProfile(String name, String phone, File? profileImage) async {
    try {
      String? imageUrl;

      if (profileImage != null) {
        TaskSnapshot snapshot = await _storage.ref('profile_pictures/${userModel.value.id}').putFile(profileImage);
        imageUrl = await snapshot.ref.getDownloadURL();
      }

      UserModel updatedUser = UserModel(
        id: userModel.value.id,
        name: name,
        email: userModel.value.email,
        mobile: phone,
        profileImageUrl: imageUrl ?? userModel.value.profileImageUrl,
      );

      userModel.value = updatedUser;

      await _firestore.collection('users').doc(userModel.value.id).update({
        'name': name,
        'mobile': phone,
        'profileImageUrl': userModel.value.profileImageUrl,
      });

      isEditing = false;
      showToast('Profile updated successfully');
    } catch (e) {
      showToast('Error: ${e.toString()}');
    }
  }

  void showToast(String message) {
    Get.snackbar('Info', message, snackPosition: SnackPosition.BOTTOM);
  }
}
