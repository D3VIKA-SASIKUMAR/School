import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/views/student/event_apply.dart';
import 'package:mini_project/views/student/event_result.dart';
import 'package:mini_project/widgets/text.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: BoldText(text: "EVENT"),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('Addevents').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Oops! Something went wrong.."));
            }
            var data = snapshot.data?.docs;
            if (data == null || data.isEmpty) {
              return const Center(child: Text("No Data Found"));
            }
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var event = data[index];

                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                    vertical: size.height * 0.01,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.event,
                        color: Colors.blue,
                        size: size.width * 0.1,
                      ),
                      title: Text(
                        event['eventname'] ??
                            'No Event Name', // Handle missing field
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        Get.to(
                          StudentEventDetail(
                            eventName: event['eventName'],
                            date: event['date'], // Fix
                            stageNo: event['stageNo'], // Fix
                            time: event['time'], // Fix
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF1F4B76),
          onPressed: () {
            Get.to(const EventApply());
          },
          child: const Icon(Icons.add, color: Colors.amber),
        ),
      ),
    );
  }
}
