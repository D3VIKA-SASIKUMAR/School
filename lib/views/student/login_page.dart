import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/services/authservices/auth_services.dart';
import 'package:mini_project/views/student/student_home_screen.dart';
import 'package:mini_project/views/student/registration.dart';
import 'package:mini_project/views/student/studentbottomnavigationbar.dart';
import 'package:mini_project/widgets/button.dart';
import 'package:mini_project/widgets/text.dart';
import 'package:mini_project/widgets/login_textformfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.2),
                  BoldText(
                    text: "Login",
                    fontSize: screenWidth * 0.06,
                  ),
                  SizedBox(height: screenHeight * 0.08), // 5% of screen height

                  // Username field
                  CustomTextFormField(
                    controller: _emailController,
                    hintText: "email",
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "email is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03), // 3% of screen height

                  // Password field
                  CustomTextFormField(
                    controller: _passwordController,
                    hintText: "Password",
                    icon: Icons.lock,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.05), // 5% of screen height

                  // Login button
                  CustomElevatedButton(
                    text: "Login",
                    onPressed: () {
                      studentLogIn();
                    },
                  ),
                  SizedBox(height: screenHeight * 0.05), // 5% of screen height

                  // Create account text
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentRegistration(),
                        ),
                      );
                    },
                    child: Text(
                      "Create an Account",
                      style: TextStyle(
                        fontSize: screenWidth *
                            0.04, // Font size will be 4% of screen width
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 32, 69, 99),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  studentLogIn() async {
    try {
      UserCredential? userCredential = await StudentAuthServices()
          .studentLogin(_emailController.text, _passwordController.text);
      if (userCredential?.user != null) {
        Get.to(() => Studentbottomnavigationbar());
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Email or Password")));
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
