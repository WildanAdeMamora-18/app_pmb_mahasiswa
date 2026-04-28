import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  // final String? Function(String?)? validator;

  CustomTextField({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    // required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Judul di atas
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),

          SizedBox(height: 6),

          // 🔹 Input field
          TextFormField(
            controller: controller,
            // validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      )
    );
  }
}