import 'package:flutter/material.dart';
import 'package:mini_project/views/organizer/organizer_appealPage.dart';
import 'package:mini_project/views/organizer/organizer_eventpage.dart';
import 'package:mini_project/views/organizer/organizer_homepage.dart';

class OrganizerBnb extends StatefulWidget {
  const OrganizerBnb({super.key});

  @override
  State<OrganizerBnb> createState() => _OrganizerBnbState();
}

class _OrganizerBnbState extends State<OrganizerBnb> {
  int indexnum = 0;

  final List<Widget> tabWidgets = [
    const OrganizerHomepage(),
    const OrganizerEventpage(),
    const OrganizerAppealpage(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: screenHeight * 0.1, // Dynamic height
          decoration: BoxDecoration(
            color: const Color(0xFF1F4B76), // Dark blue background
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Student Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    indexnum = 0; // Navigate to Student tab
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: indexnum == 0
                      ? const Color(0xFFFFC107) // Highlighted yellow
                      : const Color(0xFF1F4B76), // Default blue
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  "Assigned",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: indexnum == 0 ? Colors.black : Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              // Organizer Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    indexnum = 1; // Navigate to Organizer tab
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: indexnum == 1
                      ? const Color(0xFFFFC107) // Highlighted yellow
                      : const Color(0xFF1F4B76), // Default blue
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  "Event",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: indexnum == 1 ? Colors.black : Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              // Event Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    indexnum = 2; // Navigate to Event tab
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: indexnum == 2
                      ? const Color(0xFFFFC107) // Highlighted yellow
                      : const Color(0xFF1F4B76), // Default blue
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  "Appeal",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: indexnum == 2 ? Colors.black : Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: tabWidgets[indexnum], // Display selected tab widget
    );
  }
}
