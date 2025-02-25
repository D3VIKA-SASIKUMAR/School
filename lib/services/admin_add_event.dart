import 'package:cloud_firestore/cloud_firestore.dart';

class AdminAddEvent {
  final CollectionReference _eventCollection =
      FirebaseFirestore.instance.collection('Addevents');

  Stream<QuerySnapshot> getEvent() {
    return _eventCollection.snapshots();
  }

  Future<void> adminAdddEvent(
      String eventname, String date, String stageno, String time) async {
    await _eventCollection.add({
      "eventName": eventname,
      "date": date,
      "stageNo": stageno,
      "time": time,
    });
  }
}
