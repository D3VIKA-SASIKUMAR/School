import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/views/organizer/update_result.dart';
import 'package:mini_project/widgets/register_textformfield.dart';
import 'package:mini_project/widgets/text.dart';

class AppealDetail extends StatefulWidget {
  const AppealDetail({super.key, required String studentName});

  @override
  State<AppealDetail> createState() => _AppealDetailState();
}

class _AppealDetailState extends State<AppealDetail> {
  final TextEditingController _eventName = TextEditingController();
  final TextEditingController __videolink = TextEditingController();
  final TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            Row(
              children: [
                IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () {
                      Get.back();
                    }),
                SizedBox(width: size.width * 0.2),
                BoldText(
                  text: "Appeal Details",
                  color: Colors.black,
                  fontSize: size.width * 0.06,
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            RegisterTextformfield(
              text: "Eventname",
              controller: _eventName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your event name';
                }
                return null;
              },
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.03),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.05,
                ),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: _description,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your event name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8 * (size.width / 350),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: size.width * 0.2,
                    horizontal: size.width * 0.06,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: size.width * 0.05),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 9, 102, 12)),
                    onPressed: () {
                      Get.to(UpdateResult());
                    },
                    child: Text(
                      "Accept",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(width: size.width * 0.05),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 173, 5, 5)),
                    onPressed: () {},
                    child: Text(
                      "Reject",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(width: size.width * 0.05),
              ],
            )
          ],
        ),
      ),
    );
  }
}
