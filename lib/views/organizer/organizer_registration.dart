import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/services/authservices/organizer_auth_services.dart';
import 'package:mini_project/views/organizer/organizer_login.dart';
import 'package:mini_project/widgets/button.dart';
import 'package:mini_project/widgets/register_textformfield.dart';
import 'package:mini_project/widgets/text.dart';

class OrganizerRegistration extends StatefulWidget {
  const OrganizerRegistration({super.key});

  @override
  State<OrganizerRegistration> createState() => _OrganizerRegistrationState();
}

class _OrganizerRegistrationState extends State<OrganizerRegistration> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _organizerUsername = TextEditingController();
  final TextEditingController _organizerphnoController =
      TextEditingController();
  final TextEditingController _organizerEmail = TextEditingController();
  final TextEditingController _organizerid = TextEditingController();
  final TextEditingController _organizerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.04),
                  Image.asset('images/event.png'),
                  SizedBox(height: screenHeight * 0.04),
                  BoldText(
                    text: "Registration",
                    fontSize: screenWidth * 0.06,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  // Name Field
                  RegisterTextformfield(
                    text: "Name",
                    controller: _organizerUsername,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  RegisterTextformfield(
                    text: "Ph No",
                    controller: _organizerphnoController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone Number is required";
                      } else if (value.length != 10) {
                        return "Phone Number should be 10 digits";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  RegisterTextformfield(
                    text: "Email",
                    controller: _organizerEmail,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  RegisterTextformfield(
                    text: "ID Number",
                    controller: _organizerid,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "ID Number is required";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  RegisterTextformfield(
                    text: "Password",
                    controller: _organizerPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      } else if (value.length < 6) {
                        return 'Password should be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.04),

                  CustomElevatedButton(
                    text: "Submit",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        organizerRegistration();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  organizerRegistration() async {
    try {
      await OrganizerAuthServices().organizerRegistration(
          _organizerUsername.text,
          _organizerEmail.text,
          _organizerPassword.text,
          _organizerphnoController.text,
          _organizerid.text);
      Get.to(() => OrganizerLogin());
    } catch (e) {
      log(e.toString());
    }
  }
}
