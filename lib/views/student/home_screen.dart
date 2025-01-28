import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/views/student/event_result.dart';
import 'package:mini_project/views/student/result_detail.dart'; // Assuming you have a ResultDetail page

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  bool isToggled = true;

  final List<String> events = ["Mohiniyattam", "Kolkali"];
  final List<String> results = ["Mohiniyattam", "Kolkali"];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.02),
                Text(
                  isToggled ? "Event" : "Result",
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Expanded(
                  child: ListView.builder(
                    itemCount: isToggled ? events.length : results.length,
                    itemBuilder: (context, index) {
                      String item = isToggled ? events[index] : results[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04,
                          vertical: size.height * 0.01,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 16, 93, 156),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.photo,
                              color: Colors.blue,
                              size: size.width * 0.1,
                            ),
                            title: Text(
                              item,
                              style: TextStyle(
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            onTap: () {
                              if (isToggled) {
                                // Navigate to EventDetail page
                                Get.to(
                                    () => StudentEventDetail(eventName: item));
                              } else {
                                // Navigate to ResultDetail page
                                Get.to(() =>
                                    StudentResultDetails(eventName: item));
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: isToggled ? 4 : 3,
                      child: MaterialButton(
                        minWidth: size.width * 0.4,
                        onPressed: () {
                          setState(() {
                            isToggled = true;
                          });
                        },
                        color:
                            isToggled ? Colors.amber : const Color(0xFF103D9C),
                        elevation: isToggled ? 4 : 0,
                        height: size.height * 0.07,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Event",
                          style: TextStyle(
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.bold,
                            color: isToggled ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: isToggled ? 4 : 3,
                      child: MaterialButton(
                        minWidth: size.width * 0.4,
                        onPressed: () {
                          setState(() {
                            isToggled = false;
                          });
                        },
                        color:
                            isToggled ? const Color(0xFF103D9C) : Colors.amber,
                        elevation: isToggled ? 0 : 4,
                        height: size.height * 0.07,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Result",
                          style: TextStyle(
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.bold,
                            color: isToggled ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
