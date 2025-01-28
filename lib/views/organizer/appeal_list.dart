import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/views/organizer/appeal_detail.dart';
import 'package:mini_project/widgets/text.dart';

class AppealList extends StatefulWidget {
  const AppealList({super.key});

  @override
  State<AppealList> createState() => _AppealListState();
}

class _AppealListState extends State<AppealList> {
  final List<String> item = List.generate(5, (index) => "NAME");

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
                  text: "Appeal List",
                  color: Colors.black,
                  fontSize: size.width * 0.06,
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AppealDetail(studentName: item[index]),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 16.0),
                      child: Container(
                        padding: const EdgeInsets.all(12),
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
                              child:
                                  const Icon(Icons.person, color: Colors.blue),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const Text(
                                  "ID Number",
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
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
