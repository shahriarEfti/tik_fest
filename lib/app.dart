

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tik_fest/presentation/ui/screens/Auth/pin_code_verification.dart';
import 'package:tik_fest/presentation/ui/screens/Auth/reset_password.dart';
import 'package:tik_fest/presentation/ui/screens/Auth/sign_In_screen.dart';
import 'package:tik_fest/presentation/ui/screens/Auth/sign_up_screen.dart';
import 'package:tik_fest/presentation/ui/screens/home_screen.dart';
import 'package:tik_fest/presentation/ui/screens/profile_screen.dart';

import 'controler_binder.dart';




class tikfestApp extends StatelessWidget {
  const tikfestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      home:SignInScreen()
      //initialBinding: ControllerBinder(),
    );
  }
}
