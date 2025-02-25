import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final String fontFamily;

  const BoldText({
    super.key,
    required this.text,
    this.fontSize = 30.0,
    this.color = const Color.fromARGB(255, 0, 0, 0),
    this.fontFamily = 'Poppins',
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust font size based on a base screen width (375 is a common base width for scaling)
    double responsiveFontSize = fontSize * (screenWidth / 375);

    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: responsiveFontSize,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
