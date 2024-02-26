import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final String? errorMessageText;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.errorMessageText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        errorText: errorMessageText,
      ),
    );
  }
}
