import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/views/organizer/organizer_bnb.dart';
import 'package:mini_project/views/organizer/organizer_registration.dart';

import 'package:mini_project/widgets/button.dart';
import 'package:mini_project/widgets/text.dart';
import 'package:mini_project/widgets/login_textformfield.dart';

class OrganizerLogin extends StatefulWidget {
  const OrganizerLogin({super.key});

  @override
  State<OrganizerLogin> createState() => _OrganizerLoginState();
}

class _OrganizerLoginState extends State<OrganizerLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _organizerUsername = TextEditingController();
  final TextEditingController _organizerPassword = TextEditingController();

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
                  SizedBox(height: screenHeight * 0.1),
                  Image.asset('images/event.png'),
                  SizedBox(height: screenHeight * 0.1),
                  BoldText(
                    text: "Login",
                    fontSize: screenWidth * 0.06,
                  ),
                  SizedBox(height: screenHeight * 0.08), // 5% of screen height

                  // Username field
                  CustomTextFormField(
                    controller: _organizerUsername,
                    hintText: "Username",
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03), // 3% of screen height

                  // Password field
                  CustomTextFormField(
                    controller: _organizerPassword,
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
                      if (_formKey.currentState!.validate()) {
                        Get.to(() => OrganizerBnb());
                      }
                    },
                  ),
                  SizedBox(height: screenHeight * 0.05), // 5% of screen height

                  // Create account text
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrganizerRegistration(),
                        ),
                      );
                    },
                    child: Text(
                      "Create an Account",
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
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
}
