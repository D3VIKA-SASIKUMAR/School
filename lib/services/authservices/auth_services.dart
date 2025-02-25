import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentAuthServices {
  Future<UserCredential?> studentRegistration(String name, String email,
      String password, String phonenumber, String id, String department) async {
    try {
      final auth = FirebaseAuth.instance;
      final crud = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (crud.user != null) {
        await FirebaseFirestore.instance
            .collection("studentRegister")
            .doc(crud.user!.uid)
            .set({
          "name": name,
          "email": email,
          "phonenumber": phonenumber,
          "password": password,
          "studentId": id,
          "department": department
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<UserCredential?> studentLogin(String email, String password) async {
    try {
      final auth = FirebaseAuth.instance;
      final crud = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return crud;
    } catch (e) {
      log(e.toString());
    }
  }
}
