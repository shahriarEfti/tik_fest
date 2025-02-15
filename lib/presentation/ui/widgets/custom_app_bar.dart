import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tik_fest/presentation/ui/screens/profile_screen.dart';
import 'package:tik_fest/presentation/ui/widgets/toast.dart';

import '../screens/Auth/sign_In_screen.dart';
import 'custom_search_delegate.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Image.asset(
          'assets/icons/app_logo.png',
          height: 25,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(hintText: 'Search'),
            );
          },
          icon: const Icon(Icons.search, color: Colors.black),
        ),
        GestureDetector(
          onTap: () => _showBottomSheet(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/nurullah.jpg'),
              backgroundColor: Colors.redAccent,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Profile Info Row
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/nurullah.jpg'),
                  backgroundColor: Colors.redAccent,
                  radius: 25,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mohammad Nurullah',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'mohammadnurullah41@gmail.com',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Profile Button
                SizedBox(
                  height: 45,
                  width: 150,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => ProfileScreen());
                      print('Profile tapped');
                    },
                    icon: Icon(Icons.person, size: 24),
                    label: Text('Profile'),
                  ),
                ),

                // Logout Button
                SizedBox(
                  height: 45,
                  width: 150,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      signOut(FirebaseAuth.instance);
                      print('Logout tapped');
                    },
                    icon: Icon(Icons.logout, size: 24, color: Colors.white),
                    label: Text('Logout', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Future<void> signOut(FirebaseAuth _auth) async {
  try {
    await _auth.signOut();
    showToast(message: 'Signed out successfully');
    Get.offAll(() =>  SignInScreen());
  } catch (e) {
    showToast(message: 'Error signing out: $e');
  }
}
