import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/views/student/appeal.dart';
import 'package:mini_project/widgets/button.dart';

class StudentResultDetails extends StatelessWidget {
  final String eventName;

  const StudentResultDetails({super.key, required this.eventName});

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
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios, size: size.width * 0.06),
                    ),
                    SizedBox(width: size.width * 0.16),
                    Text(
                      "Event Result",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                  ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Date:",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "12/12/2021",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.18),
                    Text(
                      "Stage No:",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: size.width * 0.1),
                    Text(
                      "02",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.18),
                    Text(
                      "Time:",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: size.width * 0.2),
                    Text(
                      "1:30 pm",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.18),
                    Text(
                      "Location:",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: size.width * 0.12),
                    Text(
                      "Ground",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.06),
                Row(
                  children: [
                    Text(
                      "Result",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ],
                ),
                Container(
                  height: size.height * 0.32,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.blue,
                  )),
                  child: Center(
                    child: Icon(
                      Icons.image,
                      size: 100,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                CustomElevatedButton(
                  text: "Appeal",
                  onPressed: () {
                    Get.to(() => AppealApply());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
