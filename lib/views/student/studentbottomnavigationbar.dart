import 'package:flutter/material.dart';
import 'package:mini_project/views/admin/admin_homepage.dart';
import 'package:mini_project/views/admin/admin_organizer.dart';
import 'package:mini_project/views/student/student_home_screen.dart';
import 'package:mini_project/views/student/student_homescreen_2.dart';

class Studentbottomnavigationbar extends StatefulWidget {
  const Studentbottomnavigationbar({super.key});

  @override
  State<Studentbottomnavigationbar> createState() =>
      _StudentbottomnavigationbarState();
}

class _StudentbottomnavigationbarState
    extends State<Studentbottomnavigationbar> {
  int indexnum = 0;

  final List<Widget> tabWidgets = [
    const StudentHomeScreen(),
    const StudentHomescreen2(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: tabWidgets[indexnum], // Display selected tab widget
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: screenHeight * 0.08, // Adjust height dynamically
          decoration: BoxDecoration(
            color: const Color(0xFF1F4B76), // Dark blue background
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Student Button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      indexnum = 0; // Switch to Student tab
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: indexnum == 0
                          ? const Color(0xFFFFC107) // Highlighted yellow
                          : Colors.transparent, // Transparent when not selected
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    child: Text(
                      "Events",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: indexnum == 0 ? Colors.black : Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),

              // Organizer Button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      indexnum = 1; // Switch to Organizer tab
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: indexnum == 1
                          ? const Color(0xFFFFC107) // Highlighted yellow
                          : Colors.transparent, // Transparent when not selected
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    child: Text(
                      "Results",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: indexnum == 1 ? Colors.black : Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
