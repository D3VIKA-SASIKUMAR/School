import 'package:flutter/material.dart';

class ParticipantsList extends StatelessWidget {
  final String eventName;
  ParticipantsList({super.key, required this.eventName});

  final List<String> item = List.generate(2, (index) => "NAME");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            Center(
              child: Text(
                "Participant's List",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins-BoldItalic.ttf',
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 16.0),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.blue[100],
                              child: Icon(Icons.person, color: Colors.blue),
                            ),
                            SizedBox(width: 16),
                            Column(
                              children: [
                                Text(
                                  item[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  "    ID Number",
                                  style: TextStyle(color: Colors.blueGrey),
                                )
                              ],
                            ),
                          ],
                        ),
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
