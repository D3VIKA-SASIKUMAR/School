import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/widgets/button.dart';

class AddResult extends StatefulWidget {
  const AddResult({super.key});

  @override
  State<AddResult> createState() => _AddResultState();
}

class _AddResultState extends State<AddResult> {
  String? selectedEvent;
  List<String> eventList = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  // Function to fetch events from Firestore
  Future<void> fetchEvents() async {
    try {
      QuerySnapshot eventSnapshot =
          await FirebaseFirestore.instance.collection('Addevents').get();

      List<String> fetchedEvents =
          eventSnapshot.docs.map((doc) => doc['eventName'] as String).toList();

      setState(() {
        eventList = fetchedEvents;
      });
    } catch (e) {
      print("Error fetching events: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
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
                    SizedBox(width: size.width * 0.16),
                    Text(
                      "Add Result",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: size.height * 0.05),

                // Dropdown to select an event
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedEvent,
                    hint: Text("Select Event"),
                    items: eventList.map((event) {
                      return DropdownMenuItem(
                        value: event,
                        child: Text(event,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedEvent = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 12.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.25),

                CustomElevatedButton(
                  text: "Submit",
                  onPressed: () async {
                    if (selectedEvent == null) {
                      Get.snackbar("Error", "Please select an event.");
                      return;
                    }

                    try {
                      await FirebaseFirestore.instance
                          .collection('EventResults')
                          .add({
                        "eventName": selectedEvent,
                        // Store organizer ID if needed
                        "timestamp": FieldValue.serverTimestamp(),
                      });

                      Get.snackbar("Success", "Result submitted successfully!",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          colorText: Colors.white);

                      Get.back(); // Go back after submission
                    } catch (e) {
                      Get.snackbar("Error", "Failed to submit result.");
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
