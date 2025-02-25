import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentDetail extends StatelessWidget {
  final String studentName;
  final String studentid;
  final String department;
  final String phoneNumber;
  final String? stageno;

  const StudentDetail({
    super.key,
    required this.studentName,
    required this.studentid,
    required this.department,
    required this.phoneNumber,
    this.stageno,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: size.width * 0.06),
            onPressed: () => Get.back(),
          ),
          title: Text(
            "Student Detail",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.04),
              CircleAvatar(
                radius: size.width * 0.12,
                backgroundImage: const AssetImage('images/user.png'),
                onBackgroundImageError: (_, __) => const Icon(Icons.person),
              ),
              SizedBox(height: size.height * 0.04),
              Text(
                studentName ?? "Unknown Name",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(3),
                  },
                  children: [
                    _buildTableRow("ID Number", studentid),
                    _buildTableRow("Department", department),
                    _buildTableRow("Ph No", phoneNumber),
                    _buildTableRow("Stage NO", stageno ?? "Unknown"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(String title, String value) {
    return TableRow(
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
