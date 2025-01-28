import 'package:flutter/material.dart';

class RegisterTextformfield extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool obscureText;
  final String text;

  const RegisterTextformfield({
    super.key,
    required this.text,
    required this.controller,
    required this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16 * (screenWidth / 375),
              fontWeight: FontWeight.w500,
            ),
          ),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  8 * (screenWidth / 350),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: screenWidth * 0.04,
                horizontal: screenWidth * 0.06,
              ),
            ),
            style: TextStyle(
              fontSize: 14 * (screenWidth / 375),
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
