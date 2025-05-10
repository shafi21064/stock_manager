import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  const AuthInputField({
    super.key,
    required this.hingText,
    required this.controller,
    this.obscured = false,
    required this.validator,
    this.suffixIcon,
  });

  final bool obscured;
  final String hingText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final dynamic validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscured,
      decoration: InputDecoration(
        hintText: hingText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
