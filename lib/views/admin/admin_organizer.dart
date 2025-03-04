import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/views/admin/admin_organizer_assign.dart';

class AdminOrganizer extends StatefulWidget {
  const AdminOrganizer({super.key});

  @override
  State<AdminOrganizer> createState() => _AdminOrganizerState();
}

class _AdminOrganizerState extends State<AdminOrganizer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("OrganizerList"),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('OrganizerRegister')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Oops! Something went wrong.."),
              );
            }
            var data = snapshot.data?.docs;
            if (data == null || data.isEmpty) {
              return const Center(
                child: Text("No Data Found"),
              );
            }

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var organizer = data[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                    vertical: size.height * 0.01,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.blue,
                        size: size.width * 0.1,
                      ),
                      title: Text(
                        organizer['name'], // Display participant's name
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        organizer['organizerId'], // Display event name
                        style: const TextStyle(fontSize: 16),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminOrganizerAssign(
                              name: organizer['name'] ?? 'Unknown Name',
                              id: organizer['organizerId'] ?? 'Unknown ID',
                              phonenumber: organizer
                                      .data()
                                      .containsKey('phoneNumber')
                                  ? organizer['phoneNumber']
                                  : 'Not Available', // Handle missing phone number
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
