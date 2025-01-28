import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/views/common/user_choice.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Get.off(() => UserChoice(),
          transition: Transition.zoom, duration: Duration(milliseconds: 500));
    });

    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 52, 82),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 1.0,
              child: Image.asset(
                'images/splash_screen.png',
                height: screenHeight * 0.4,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
