import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/views/organizer/add_result.dart';

class OrganizerEventpage extends StatefulWidget {
  const OrganizerEventpage({super.key});

  @override
  State<OrganizerEventpage> createState() => _OrganizerEventpageState();
}

class _OrganizerEventpageState extends State<OrganizerEventpage> {
  bool isToggled = true;
  List<String> events = ["Event 1", "Event 2", "Event 3"];
  List<String> results = ["Result 1", "Result 2", "Result 3"];

  @override
  void initState() {
    super.initState();
  }

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
                SizedBox(height: size.height * 0.12),
                Expanded(
                  child: ListView.builder(
                    itemCount: isToggled ? events.length : results.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.01,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 85, 141, 187),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            title: Center(
                              child: Text(
                                "mohiniyattam",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: isToggled ? 4 : 3,
                      child: MaterialButton(
                        minWidth: size.width * 0.5,
                        onPressed: () {
                          setState(() {
                            isToggled = true;
                          });
                        },
                        color: isToggled
                            ? const Color.fromARGB(255, 253, 190, 64)
                            : const Color.fromARGB(255, 34, 118, 187),
                        elevation: isToggled ? 4 : 0,
                        height: size.height * 0.05,
                        shape: const RoundedRectangleBorder(
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
                        minWidth: size.width * 0.8,
                        onPressed: () {
                          setState(() {
                            isToggled = false;
                          });
                        },
                        color: isToggled
                            ? const Color.fromARGB(255, 34, 118, 187)
                            : const Color.fromARGB(255, 253, 190, 64),
                        elevation: isToggled ? 0 : 4,
                        height: size.height * 0.05,
                        shape: const RoundedRectangleBorder(
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
        floatingActionButton: isToggled
            ? null
            : FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: Colors.amber,
                onPressed: () {
                  Get.to(AddResult());
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 50,
                ),
              ),
      ),
    );
  }
}
