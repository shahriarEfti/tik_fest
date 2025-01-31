import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Data/services/firebase_auth_services.dart';
import '../../widgets/toast.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email Verification"),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter Your Email Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    shadowColor: Colors.black26,
                  ),
                  onPressed: () async {
                    await _sendVerificationEmail();
                  },
                  child: const Text(
                    "Send Verification Email",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sendVerificationEmail() async {
    String email = _emailController.text.trim();
    if (email.isEmpty) {
      showToast(message: "Please enter a valid email address.");
      return;
    }

    try {
      await _authService.sendVerificationEmail(email);
      showToast(message: "Verification email sent. Please check your inbox.");
    } catch (e) {
      showToast(message: "Error: ${e.toString()}");
    }
  }
}
