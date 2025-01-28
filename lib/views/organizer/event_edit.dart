import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/views/admin/admin_event.dart';
import 'package:mini_project/views/organizer/organizer_bnb.dart';
import 'package:mini_project/widgets/button.dart';
import 'package:mini_project/widgets/register_textformfield.dart';
import 'package:mini_project/widgets/text.dart';

class EventEdit extends StatefulWidget {
  const EventEdit({super.key});

  @override
  State<EventEdit> createState() => _EventEditState();
}

class _EventEditState extends State<EventEdit> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _eventName = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _stageNo = TextEditingController();
  final TextEditingController _time = TextEditingController();
  final TextEditingController _location = TextEditingController();

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
                  Row(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminEvent()),
                            );
                          }),
                      SizedBox(width: screenWidth * 0.2),
                      BoldText(
                        text: "Edit Event",
                        color: Colors.black,
                        fontSize: screenWidth * 0.06,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  // Name Field
                  RegisterTextformfield(
                    text: " Event Name",
                    controller: _eventName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Event Name is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  RegisterTextformfield(
                    text: "Date",
                    controller: _dateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Date is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  RegisterTextformfield(
                    text: "Stage No",
                    controller: _stageNo,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the stage number ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  RegisterTextformfield(
                    text: "Time",
                    controller: _time,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Time is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  RegisterTextformfield(
                    text: "Location",
                    controller: _location,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Location is required";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: screenHeight * 0.15),

                  CustomElevatedButton(
                    text: "Submit",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.to(OrganizerBnb());
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
