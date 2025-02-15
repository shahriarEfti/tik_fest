import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';

import '../../state_holder/profile_controler.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Personal Details'),
        actions: [
          IconButton(
            icon: Icon(controller.isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              controller.isEditing = !controller.isEditing;
              controller.update();
            },
          ),
        ],
      ),
      body: GetBuilder<ProfileController>(
        builder: (_) {
          // Check if userModel is fetched
          if (controller.userModel.value.id.isEmpty) {
            return Center(child: CircularProgressIndicator());  // Show loading indicator if data is not fetched
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(controller.userModel.value.profileImageUrl),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: controller.firstNameController,
                  enabled: controller.isEditing,
                  decoration: InputDecoration(labelText: 'Full Name'),
                ),
                TextField(
                  controller: controller.mobileController,
                  enabled: controller.isEditing,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                ),
                if (controller.isEditing)
                  ElevatedButton(
                    onPressed: () async {
                      File? pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery)?.then((image) => File(image!.path));
                      if (pickedImage != null) {
                        await controller.updateProfile(
                          controller.firstNameController.text,
                          controller.mobileController.text,
                          pickedImage,
                        );
                      }
                    },
                    child: Text('Update Profile Picture'),
                  ),
                if (controller.isEditing)
                  ElevatedButton(
                    onPressed: () async {
                      // Handle password change logic here
                    },
                    child: Text('Change Password'),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
