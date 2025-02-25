import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/views/organizer/organizer_bnb.dart';
import 'package:mini_project/widgets/button.dart';
import 'package:mini_project/widgets/register_textformfield.dart';
import 'package:mini_project/widgets/text.dart';

class EventEdit extends StatefulWidget {
  final Map<String, dynamic> event; // Receive event data

  const EventEdit({super.key, required this.event});

  @override
  State<EventEdit> createState() => _EventEditState();
}

class _EventEditState extends State<EventEdit> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _eventName;
  late TextEditingController _dateController;
  late TextEditingController _stageNo;
  late TextEditingController _time;
  late TextEditingController _location;

  @override
  void initState() {
    super.initState();
    _eventName = TextEditingController(text: widget.event['eventName']);
    _dateController = TextEditingController(text: widget.event['date']);
    _stageNo = TextEditingController(text: widget.event['stage']);
    _time = TextEditingController(text: widget.event['time']);
    _location = TextEditingController(text: widget.event['location']);
  }

  @override
  void dispose() {
    _eventName.dispose();
    _dateController.dispose();
    _stageNo.dispose();
    _time.dispose();
    _location.dispose();
    super.dispose();
  }

  Future<void> updateEvent() async {
    try {
      await FirebaseFirestore.instance
          .collection('Events') // Adjust collection name if needed
          .doc(widget.event['eventId']) // Ensure event has a unique ID
          .update({
        'eventName': _eventName.text,
        'date': _dateController.text,
        'stage': _stageNo.text,
        'time': _time.text,
        'location': _location.text,
      });

      Get.snackbar("Success", "Event updated successfully",
          snackPosition: SnackPosition.BOTTOM);
      Navigator.pop(context); // Return to previous page
    } catch (e) {
      Get.snackbar("Error", "Failed to update event: $e",
          snackPosition: SnackPosition.BOTTOM);
    }
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
                          onPressed: () => Navigator.pop(context)),
                      SizedBox(width: screenWidth * 0.2),
                      BoldText(
                        text: "Edit Event",
                        color: Colors.black,
                        fontSize: screenWidth * 0.06,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  RegisterTextformfield(
                    text: "Event Name",
                    controller: _eventName,
                    validator: (value) =>
                        value!.isEmpty ? "Event Name is required" : null,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  RegisterTextformfield(
                    text: "Date",
                    controller: _dateController,
                    validator: (value) =>
                        value!.isEmpty ? "Date is required" : null,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  RegisterTextformfield(
                    text: "Stage No",
                    controller: _stageNo,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter stage number' : null,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  RegisterTextformfield(
                    text: "Time",
                    controller: _time,
                    validator: (value) =>
                        value!.isEmpty ? "Time is required" : null,
                  ),
                  SizedBox(height: screenHeight * 0.15),
                  CustomElevatedButton(
                    text: "Submit",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        updateEvent();
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
