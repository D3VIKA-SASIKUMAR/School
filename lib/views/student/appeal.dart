import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/widgets/button.dart';
import 'package:mini_project/widgets/register_textformfield.dart';

class AppealApply extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idnoController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  AppealApply({super.key});

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
                      width: size.width * 0.15,
                    ),
                    Text(
                      "Applyc Appeal",
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
                  height: size.height * 0.03,
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
                  text: "Video Link",
                  controller: _idnoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Video link  is required";
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
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Type description here...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 58, 155, 235),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 10, 12, 14),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                CustomElevatedButton(
                  text: "Submit",
                  onPressed: () {},
                )
              ]))),
    )));
  }
}
