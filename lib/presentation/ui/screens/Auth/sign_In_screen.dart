import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tik_fest/presentation/ui/screens/Auth/sign_up_screen.dart';
import 'package:tik_fest/presentation/ui/screens/home_screen.dart';
import '../../../state_holder/sign_in_controler.dart';
import '../../widgets/form_container_widget.dart';
import '../utility/app_constants.dart';

class SignInScreen extends StatelessWidget {
  final SignInController controller = Get.put(SignInController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? validatePassword(String? value) {
    if (value?.trim().isEmpty ?? true) return 'Enter your password';
    if (!AppConstants.passwordRegExp.hasMatch(value!)) {
      return 'Password must be at least 8 characters, include uppercase, lowercase, number & special character.';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value?.trim().isEmpty ?? true) return 'Enter Your Email';
    if (!AppConstants.emailRegExp.hasMatch(value!)) return 'Enter a valid Email';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.redAccent.shade200, Colors.pinkAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Welcome Back',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    FormContainerWidget(
                      controller: emailController,
                      hintText: 'Enter Email',
                      validator: validateEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    FormContainerWidget(
                      controller: passwordController,
                      hintText: 'Enter Password',
                      validator: validatePassword,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (validateEmail(emailController.text) == null &&
                            validatePassword(passwordController.text) == null) {
                          controller.signIn(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () => Get.to(SignUpScreen()),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
