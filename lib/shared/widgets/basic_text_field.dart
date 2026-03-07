import 'package:flutter/material.dart';
import 'package:spotify_clone/shared/theme/app_colors.dart';

class BasicTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;

  const BasicTextField({
    required this.hintText,
    this.controller,
    this.isPassword = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.grey),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.grey, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.grey, width: 0.5),
        ),
        suffixIcon: isPassword
            ? const Icon(Icons.visibility_off, color: AppColors.grey)
            : null,
      ),
    );
  }
}
