import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final IconData? icon;

  const CustomTextFormField({super.key, 
    required this.controller,
    this.obscureText = false,
    this.validator,
    this.hintText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(
        fontSize: 16 * (screenWidth / 375),
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14 * (screenWidth / 375),
        ),
        prefixIcon: icon != null
            ? Icon(
                icon,
                size: 20 * (screenWidth / 375),
              )
            : null,
        contentPadding: EdgeInsets.symmetric(
          vertical: 12 * (screenWidth / 350),
          horizontal: 16 * (screenWidth / 350),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              8 * (screenWidth / 375)), // Responsive border radius
        ),
      ),
    );
  }
}
