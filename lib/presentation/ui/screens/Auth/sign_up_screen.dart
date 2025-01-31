import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tik_fest/presentation/ui/screens/Auth/sign_in_screen.dart';
import '../../../state_holder/sign_up_controler.dart';
import '../../widgets/form_container_widget.dart';
import '../utility/app_constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.grey.shade600,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Foreground Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // App Logo
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: Image.asset('assets/images/applogo.png'),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Create an Account',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Username Input Field
                      FormContainerWidget(
                        controller: controller.usernameController,
                        hintText: "Username",
                        isPasswordField: false,
                      ),
                      const SizedBox(height: 12),

                      // Email Input Field
                      FormContainerWidget(
                        controller: controller.emailController,
                        hintText: "Email",
                        isPasswordField: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return 'Enter your email address';
                          }
                          if (!AppConstants.emailRegExp.hasMatch(value!)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 12),

                      // Phone Input Field
                      /*FormContainerWidget(
                        controller: controller.phoneController,
                        hintText: "Phone Number",
                        isPasswordField: false,
                      ),

                      const SizedBox(height: 12),*/

                      // Password Input Field
                      FormContainerWidget(
                        controller: controller.passwordController,
                        hintText: "Password",
                        isPasswordField: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return 'Enter your password';
                          }
                          if (!AppConstants.passwordRegExp.hasMatch(value!)) {
                            return 'Password must be at least 8 characters, include\nuppercase, lowercase, number & special character.';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 24),

                      // Signup Button
                      GetX<SignUpController>(
                        builder: (controller) {
                          return GestureDetector(
                            onTap: controller.signUp,
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 15,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: controller.isSigningUp.value
                                    ? const CircularProgressIndicator(
                                        color: Colors.redAccent)
                                    : const Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 18),

                      // Divider
                      const Divider(thickness: 1, color: Colors.grey),
                      const SizedBox(height: 18),

                      // Sign In Navigation
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: [
                            const Text("Already have an account?"),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => SignInScreen());
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
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
