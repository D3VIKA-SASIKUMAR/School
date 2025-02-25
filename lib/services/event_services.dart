import 'package:cloud_firestore/cloud_firestore.dart';

class EventService {
  final CollectionReference _eventCollection =
      FirebaseFirestore.instance.collection('events');
  final CollectionReference _eventRegCollection =
      FirebaseFirestore.instance.collection('Addevents');

  // Get all todos
  Stream<QuerySnapshot> getEvent() {
    return _eventCollection.snapshots();
  }

  Future<void> addEvent(String name, String eventname, String id,
      String department, String phonenumber) async {
    await _eventCollection.add({
      'eventname': eventname,
      'name': name,
      "studentId": id,
      "department": department,
      "phonenumber": phonenumber,
    });
  }

  Future<void> assignOrganizerEvent(
      String name, String eventname, String id, String phonenumber) async {
    QuerySnapshot querySnapshot = await _eventRegCollection
        .where('eventName', isEqualTo: eventname)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await querySnapshot.docs.first.reference.update({
        'organizer_id': id,
      });
    } else {
      throw Exception('Event not found');
    }
  }
}
