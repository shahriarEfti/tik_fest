

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tik_fest/presentation/ui/screens/home_screen.dart';
import 'package:tik_fest/presentation/ui/screens/splash_screen.dart';

import 'controler_binder.dart';

class tikfestApp extends StatelessWidget {
  const tikfestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      initialBinding: ControllerBinder(),
    );
  }
}
