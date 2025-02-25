import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/widgets/text.dart';

class OrganizerHomepage extends StatefulWidget {
  const OrganizerHomepage({super.key});

  @override
  State<OrganizerHomepage> createState() => _OrganizerHomepageState();
}

class _OrganizerHomepageState extends State<OrganizerHomepage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            BoldText(text: "Assigned Events"),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Addevents')
                    .where('organizer_id', isEqualTo: '')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(
                        child: Text("Oops! Something went wrong.."));
                  }
                  var data = snapshot.data?.docs;
                  if (data == null || data.isEmpty) {
                    return const Center(child: Text("No Data Found"));
                  }

                  return ListView.builder(
                    padding: EdgeInsets.all(15),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var eventData = data[index];
                      return _EventTile(eventData: eventData);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _EventTile extends StatelessWidget {
  final QueryDocumentSnapshot eventData;

  const _EventTile({required this.eventData});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final String eventName = eventData['eventName'] ?? "Unknown Event";
    final String date = eventData['date'] ?? "N/A";
    final String stageno = eventData['stageNo'] ?? "N/A";
    final String time = eventData['time'] ?? "N/A";

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 85, 141, 187),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  eventName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection('Addevents')
                        .doc(eventData.id)
                        .delete();
                  },
                  icon: const Icon(Icons.delete, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 8),
            _buildDetailText("Date: $date", size),
            _buildDetailText("Stage No: $stageno", size),
            _buildDetailText("Time: $time", size),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailText(String text, Size size) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: size.width * 0.04,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
