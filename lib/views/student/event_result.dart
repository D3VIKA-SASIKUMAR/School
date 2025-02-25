import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentEventDetail extends StatelessWidget {
  final String eventName;
  final String date;
  final String stageNo;
  final String time;

  const StudentEventDetail({
    super.key,
    required this.eventName,
    required this.date,
    required this.stageNo,
    required this.time,
  });

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
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back_ios, size: size.width * 0.06),
                    ),
                    const Spacer(),
                    Text(
                      "Event Detail",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: size.height * 0.08),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/user.png'),
                ),
                SizedBox(height: size.height * 0.04),
                Text(
                  eventName,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: size.height * 0.08),
                buildDetailRow("Date:", date, size),
                buildDetailRow("Stage No:", stageNo, size),
                buildDetailRow("Time:", time, size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(String label, String value, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: Row(
        children: [
          SizedBox(width: size.width * 0.18),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: size.width * 0.045,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: size.width * 0.1),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: size.width * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
