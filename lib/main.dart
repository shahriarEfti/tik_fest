import 'package:flutter/material.dart';
import 'package:tik_fest/app.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();

  runApp(const tikfestApp());
}



