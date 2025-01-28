import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/widgets/button.dart';

class AddResult extends StatefulWidget {
  const AddResult({super.key});

  @override
  State<AddResult> createState() => _AddResultState();
}

class _AddResultState extends State<AddResult> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Column(children: [
                      SizedBox(height: size.height * 0.05),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back_ios,
                                size: size.width * 0.06),
                          ),
                          SizedBox(width: size.width * 0.16),
                          Text(
                            "Add Result",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListTile(
                          title: Text(
                            "Oppana",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 40,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Row(
                        children: [
                          Text(
                            "Image",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                      SizedBox(
                        height: size.height * 0.25,
                      ),
                      CustomElevatedButton(
                        text: "submit",
                        onPressed: () {
                          Get.back();
                        },
                      )
                    ])))));
  }
}
