import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tik_fest/presentation/ui/screens/Auth/sign_up_screen.dart';
import '../../../state_holder/sign_in_controler.dart';
import '../../widgets/form_container_widget.dart';
import '../utility/app_constants.dart';
import 'email_varification_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController controller = Get.put(SignInController());
  bool isSigning = false;

  Future<void> handleSignIn() async {
    setState(() => isSigning = true);
    await controller.signIn();
    setState(() => isSigning = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey.shade400,
                    Colors.black,
                    Colors.grey.shade400,
                  ],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 60, left: 22),
                child: Text(
                  'Hello\nWelcome Back!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.asset('assets/images/humans.png'),
                        ),
                        const SizedBox(height: 10),
                        FormContainerWidget(
                          controller: controller.emailOrPhoneController,
                          hintText: "Email or Phone",
                          isPasswordField: false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter your email or phone number';
                            }
                            if (!AppConstants.emailRegExp.hasMatch(value!) &&
                                !AppConstants.phoneRegExp.hasMatch(value)) {
                              return 'Enter a valid email or phone number';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),
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
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: _goForgotPassword,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: handleSignIn,
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: isSigning
                                  ? const CircularProgressIndicator(
                                  color: Colors.white)
                                  : const Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () => controller.signInWithGoogle(),
                          child: Container(
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/google.png',
                                  height: 24,
                                  width: 24,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Sign In with Google',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 122),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text("Don't have an account?"),
                              GestureDetector(
                                onTap: () => Get.to(() => const SignUpScreen()),
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _goForgotPassword() {
    Get.to(EmailVerificationScreen() );
  }
}
