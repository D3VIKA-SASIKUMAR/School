import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_project/services/event_services.dart';
import 'package:mini_project/widgets/button.dart';
import 'package:mini_project/widgets/register_textformfield.dart';

class EventApply extends StatefulWidget {
  const EventApply({super.key});

  @override
  _EventApplyState createState() => _EventApplyState();
}

class _EventApplyState extends State<EventApply> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phnoController = TextEditingController();
  final TextEditingController _idnoController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();

  String? selectedValue;

  void _clearFormFields() {
    _nameController.clear();
    _phnoController.clear();
    _idnoController.clear();
    _departmentController.clear();
    setState(() {
      selectedValue = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios, size: size.width * 0.06),
                    ),
                    Spacer(),
                    Text(
                      "Apply",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
                SizedBox(height: size.height * 0.08),

                // Fetch event names from Firestore
                Row(
                  children: [
                    Text(
                      "Event",
                      style: TextStyle(
                        fontSize: 16 * (size.width / 375),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.01),

                // StreamBuilder to dynamically fetch events
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Addevents')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }

                    var eventDocs = snapshot.data!.docs;
                    List<DropdownMenuItem<String>> eventItems = eventDocs
                        .map((doc) => DropdownMenuItem<String>(
                              value: doc['eventName'],
                              child: Text(doc['eventName']),
                            ))
                        .toList();

                    return DropdownButtonFormField<String>(
                      value: selectedValue,
                      items: eventItems,
                      onChanged: (newValue) {
                        setState(() {
                          selectedValue = newValue;
                        });
                      },
                      decoration: InputDecoration(
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
                    );
                  },
                ),

                SizedBox(height: size.height * 0.03),

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
                SizedBox(height: size.height * 0.03),

                // ID Number Field
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
                SizedBox(height: size.height * 0.03),

                // Phone Number Field
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
                SizedBox(height: size.height * 0.03),

                // Department Field
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

                // Submit Button
                CustomElevatedButton(
                  text: "Submit",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      try {
                        await EventService().addEvent(
                          _nameController.text,
                          selectedValue!,
                          _idnoController.text,
                          _departmentController.text,
                          _phnoController.text,
                        );

                        Get.snackbar(
                          "Success",
                          "Application submitted successfully!",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );

                        _clearFormFields();
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
    );
  }
}
