import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/services/event_services.dart';
import 'package:mini_project/widgets/button.dart';

class AdminOrganizerAssign extends StatefulWidget {
  final String name;
  final String id;
  final String phonenumber;

  const AdminOrganizerAssign({
    super.key,
    required this.name,
    required this.id,
    required this.phonenumber,
  });

  @override
  State<AdminOrganizerAssign> createState() => _AdminOrganizerAssignState();
}

class _AdminOrganizerAssignState extends State<AdminOrganizerAssign> {
  List<String> selectedEvents = [];
  List<String> eventList = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  // Fetch Events from Firestore
  Future<void> fetchEvents() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('Addevents').get();

      List<String> events = snapshot.docs
          .map((doc) => doc['eventName'].toString()) // Extract event names
          .toList();

      setState(() {
        eventList = events;
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
        body: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios, size: size.width * 0.06),
                ),
                Text(
                  "Assign Organizer",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: size.width * 0.16),
              ],
            ),
            SizedBox(height: size.height * 0.03),

            // Organizer Name
            Text(widget.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            // ID Container
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                height: size.height * 0.05,
                width: size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.id),
                ),
              ),
            ),

            // Phone Number Container
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                height: size.height * 0.05,
                width: size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.phonenumber),
                ),
              ),
            ),

            // Assign Events Title
            Text("Assign Events",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            // Dropdown Button for Events
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: Text("Select an Event"),
                  underline: SizedBox(), // Removes default underline
                  onChanged: (String? newValue) {
                    if (newValue != null &&
                        !selectedEvents.contains(newValue)) {
                      setState(() {
                        selectedEvents.add(newValue);
                      });
                    }
                  },
                  items:
                      eventList.map<DropdownMenuItem<String>>((String event) {
                    return DropdownMenuItem<String>(
                      value: event,
                      child: Text(event),
                    );
                  }).toList(),
                ),
              ),
            ),

            // Display Selected Events with Bullets
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                height: size.height * 0.2,
                width: size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: selectedEvents.isEmpty
                      ? Text("No events selected")
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: selectedEvents.map((event) {
                            return Row(
                              children: [
                                Text("• ",
                                    style: TextStyle(
                                        fontSize: 18)), // Bullet Point
                                Expanded(child: Text(event)),
                              ],
                            );
                          }).toList(),
                        ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.1),
            CustomElevatedButton(
              text: "Assign",
              onPressed: () async {
                try {
                  for (String event in selectedEvents) {
                    await EventService().assignOrganizerEvent(
                        widget.name, event, widget.id, widget.phonenumber);
                  }
                } catch (e) {
                  print(e);
                }

                if (selectedEvents.isNotEmpty) {
                  Get.snackbar(
                    "Assigned",
                    "Organizer assigned to: ${selectedEvents.join(', ')}",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  Get.snackbar(
                    "Error",
                    "Please select at least one event.",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
