import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/views/admin/bottom_navigation_bar.dart';
import 'package:mini_project/widgets/button.dart';
import 'package:mini_project/widgets/text.dart';
import 'package:mini_project/widgets/login_textformfield.dart';

class Adminloginpage extends StatefulWidget {
  const Adminloginpage({super.key});

  @override
  State<Adminloginpage> createState() => _AdminloginpageState();
}

class _AdminloginpageState extends State<Adminloginpage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _adminusernameController =
      TextEditingController();
  final TextEditingController _adminpasswordController =
      TextEditingController();

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
                  SizedBox(height: screenHeight * 0.08),

                  CustomTextFormField(
                    controller: _adminusernameController,
                    hintText: "Username",
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username is required";
                      } else {
                        if (value != "DEVIKA") {
                          return "Invalid Username";
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  CustomTextFormField(
                    controller: _adminpasswordController,
                    hintText: "Password",
                    icon: Icons.lock,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value != "9809") {
                        return 'INCORRECT PASSWORD';
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
                        Get.to(() => AdminBottomNavigationBar());
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
}
