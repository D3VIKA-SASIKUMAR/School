import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/widgets/button.dart';
import 'package:mini_project/widgets/register_textformfield.dart';

class EventApply extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phnoController = TextEditingController();
  final TextEditingController _idnoController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  EventApply({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            body: Form(
      key: _formKey,
      child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(children: [
                SizedBox(height: size.height * 0.05),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios, size: size.width * 0.06),
                    ),
                    SizedBox(
                      width: size.width * 0.25,
                    ),
                    Text(
                      "Apply",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: size.height * 0.08),
                CircleAvatar(
                  radius: size.width * 0.12,
                  backgroundImage: AssetImage('images/user.png'),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
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
                SizedBox(
                  height: size.height * 0.03,
                ),
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
                SizedBox(
                  height: size.height * 0.03,
                ),
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
                SizedBox(
                  height: size.height * 0.03,
                ),
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
                SizedBox(height: size.height * 0.07),
                CustomElevatedButton(
                  text: "Submit",
                  onPressed: () {},
                )
              ]))),
    )));
  }
}
