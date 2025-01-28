import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double responsiveHorizontalPadding = screenWidth * 0.37;
    double responsiveVerticalPadding = screenHeight * 0.017;
    double responsiveFontSize = screenWidth * 0.04;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveHorizontalPadding,
          vertical: responsiveVerticalPadding,
        ),
        backgroundColor: const Color.fromARGB(255, 15, 52, 82),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: responsiveFontSize, // Use responsive font size
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
