import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrganizerAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Organizer Registration
  Future<UserCredential?> organizerRegistration(String name, String email,
      String password, String phoneNumber, String id) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _firestore.collection("OrganizerRegister").doc().set({
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "organizerId": id,
      });

      return userCredential;
    } catch (e) {
      log("Error: ${e.toString()}");
      return null;
    }
  }

  // Organizer Login
  Future<UserCredential?> organizerLogin(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log("Error: ${e.toString()}");
      return null;
    }
  }
}
