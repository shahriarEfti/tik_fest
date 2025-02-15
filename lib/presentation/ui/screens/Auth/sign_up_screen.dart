import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tik_fest/presentation/ui/screens/Auth/sign_In_screen.dart';

import '../../../state_holder/sign_up_controler.dart';
import '../../widgets/form_container_widget.dart';
import '../utility/app_constants.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();
  File? _selectedImage;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/SignUp.png', fit: BoxFit.cover),
          ),
          Positioned(
            top: 80,
            left: 30,
            right: 0,
            child: SizedBox(height: 320, child: Image.asset('assets/images/humans.png')),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 50, width: 50, child: Image.asset('assets/images/Tikfest.png')),
                      const SizedBox(height: 16),
                      FormContainerWidget(controller: controller.nameController, hintText: 'Enter Name', keyboardType: TextInputType.text),
                      FormContainerWidget(controller: controller.emailController, hintText: 'Enter Email', validator: validateEmail, keyboardType: TextInputType.emailAddress),
                      FormContainerWidget(controller: controller.passwordController, hintText: 'Enter Password', obscureText: true, validator: validatePassword, keyboardType: TextInputType.visiblePassword),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.signUp(_selectedImage);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account? '),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: (){
                                Get.to(SignInScreen());
                              },
                              child: Text('SignIn',style: TextStyle(
                                  fontWeight: FontWeight.bold,color: Colors.redAccent),),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                
              ),
              
            ),
          ),

        ],
      ),
    );
  }
}
