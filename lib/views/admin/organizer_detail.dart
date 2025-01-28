import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/widgets/register_textformfield.dart';
import 'package:mini_project/widgets/text.dart';

class AdminOrganizerDetail extends StatelessWidget {
  final String organizername;

  AdminOrganizerDetail({super.key, required this.organizername});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _organizerid = TextEditingController();
  final TextEditingController _organizerphnoController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                        icon:
                            Icon(Icons.arrow_back_ios, size: size.width * 0.06),
                      ),
                      SizedBox(
                        width: size.height * 0.08,
                      ),
                      Text(
                        "organizer Detail",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: size.height * 0.08),
                  CircleAvatar(
                    radius: size.width * 0.12,
                    backgroundImage: AssetImage('images/user.png'),
                  ),
                  SizedBox(height: size.height * 0.04),
                  Text(
                    " $organizername",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: size.height * 0.08),
                  RegisterTextformfield(
                      text: "ID Number",
                      controller: _organizerid,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your ID Number';
                        }
                        return null;
                      }),
                  SizedBox(height: size.height * 0.03),
                  RegisterTextformfield(
                      text: "Ph No",
                      controller: _organizerphnoController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Phone Number';
                        } else {
                          if (value.length < 10) {
                            return 'Please enter valid Phone Number';
                          }
                          return null;
                        }
                      }),
                  SizedBox(height: size.height * 0.2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 26, 91, 28),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {},
                          child: BoldText(
                            fontSize: 16,
                            text: "Accept",
                            color: Colors.white,
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 151, 7, 7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {},
                          child: BoldText(
                            fontSize: 16,
                            text: "Reject",
                            color: Colors.white,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
