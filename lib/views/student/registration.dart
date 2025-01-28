import 'package:flutter/material.dart';
import 'package:mini_project/views/student/home_screen.dart';
import 'package:mini_project/widgets/button.dart';
import 'package:mini_project/widgets/register_textformfield.dart';
import 'package:mini_project/widgets/text.dart';

class StudentRegistration extends StatefulWidget {
  const StudentRegistration({super.key});

  @override
  State<StudentRegistration> createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phnoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _idnoController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  SizedBox(height: screenHeight * 0.08),
                  BoldText(
                    text: "Register",
                    fontSize: screenWidth * 0.06,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  // Name Field
                  RegisterTextformfield(
                    text: "Name",
                    controller: _nameController,
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
                    controller: _phnoController,
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
                    controller: _emailController,
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
                    controller: _idnoController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "ID Number is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  RegisterTextformfield(
                    text: "Department",
                    controller: _departmentController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Department is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  RegisterTextformfield(
                    text: "Password",
                    controller: _passwordController,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentHomeScreen(),
                          ),
                        );
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
