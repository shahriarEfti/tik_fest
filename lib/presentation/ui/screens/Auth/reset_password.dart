import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});


  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _loadingInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Set Password")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter a new password', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 24),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(hintText: 'New Password'),
              obscureText: true,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(hintText: 'Confirm Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            _loadingInProgress
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
              onPressed: _resetPassword,
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _resetPassword() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match!")),
      );
      return;
    }
    setState(() {
      _loadingInProgress = true;
    });
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user = auth.currentUser;
      await user?.updatePassword(_passwordController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password reset successful!")),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to reset password: \$e")),
      );
    }
    setState(() {
      _loadingInProgress = false;
    });
  }
}
