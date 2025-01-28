import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/views/organizer/appeal_list.dart';

class OrganizerAppealpage extends StatefulWidget {
  const OrganizerAppealpage({super.key});

  @override
  State<OrganizerAppealpage> createState() => _OrganizerAppealpageState();
}

class _OrganizerAppealpageState extends State<OrganizerAppealpage> {
  final List<String> events = ["Mohiniyattam", "Kolkali"];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.05),
            Text(
              "Appeal",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  events[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.01,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 85, 141, 187),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        title: Center(
                          child: Text(
                            events[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        onTap: () {
                          Get.to(() => AppealList());
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
