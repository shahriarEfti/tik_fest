import 'package:flutter/material.dart';

class LargeHeadlines extends StatelessWidget {
  final String label; // Declare the label variable

  const LargeHeadlines({
    super.key,
    required this.label, // Use a comma instead of a semicolon
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label, // Use the label variable here
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}