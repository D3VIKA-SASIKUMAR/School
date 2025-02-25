import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/views/admin/admin_event.dart';
import 'package:mini_project/views/admin/bottom_navigation_bar.dart';
import 'package:mini_project/widgets/button.dart';
import 'package:mini_project/widgets/register_textformfield.dart';
import 'package:mini_project/widgets/text.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _eventName = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _stageNo = TextEditingController();
  final TextEditingController _time = TextEditingController();
  String? selectedValue;

  void _clearFormFields() {
    _eventName.clear();
    _dateController.clear();
    _stageNo.clear();
    _time.clear();
    setState(() {
      selectedValue = null;
    });
  }

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
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.08),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        onPressed: () {
                          Get.off(() => AdminBottomNavigationBar(),
                              arguments: {"selectedIndex": 2});
                        },
                      ),
                      SizedBox(width: screenWidth * 0.2),
                      BoldText(
                        text: "Add Event",
                        color: Colors.black,
                        fontSize: screenWidth * 0.06,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: DropdownButtonFormField<String>(
                      value: selectedValue,
                      items: <String>[
                        'Oppana',
                        'Mohiniyattam',
                        'Kolkali',
                        'Break Dance',
                        'Bharatanatyam',
                        'Kuchipudi',
                        'Kathak',
                        'Odissi',
                        'Manipuri',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedValue = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Event Name",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 12.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select an event";
                        }
                        return null;
                      },
                    ),
                  ),
                  RegisterTextformfield(
                    text: "Date",
                    controller: _dateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Date is required";
                      }
                      final datePattern = RegExp(r'^\d{4}-\d{2}-\d{2}$');
                      if (!datePattern.hasMatch(value)) {
                        return "Please enter a valid date (YYYY-MM-DD)";
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
                        return 'Please enter the stage number';
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
                      // Validate time format (HH:MM AM/PM)
                      final timePattern =
                          RegExp(r'^(0[1-9]|1[0-2]):[0-5][0-9] (AM|PM)$');
                      if (!timePattern.hasMatch(value)) {
                        return "Please enter a valid time (hh:mm AM/PM)";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.26),
                  CustomElevatedButton(
                    text: "Submit",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        try {
                          await FirebaseFirestore.instance
                              .collection('Addevents')
                              .add({
                            "eventName": selectedValue,
                            "date": _dateController.text,
                            "stageNo": _stageNo.text,
                            "time": _time.text,
                            "organizer_id": "",
                          });

                          Get.snackbar(
                            "Success",
                            "Event added successfully!",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                          );

                          _clearFormFields(); // Clear form fields after submission
                          Get.to(() => AdminBottomNavigationBar());
                        } catch (e) {
                          Get.snackbar(
                            "Error",
                            "Something went wrong. Please try again.",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      } else {
                        Get.snackbar(
                          "Error",
                          "Please fill in all required fields correctly.",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.orange,
                          colorText: Colors.white,
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
