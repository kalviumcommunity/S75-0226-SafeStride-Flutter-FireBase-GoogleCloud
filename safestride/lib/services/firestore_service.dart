import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addData(String text) async {
    await _db.collection('notes').add({
      'text': text,
      'createdAt': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> readData() {
    return _db.collection('notes').orderBy('createdAt').snapshots();
  }

  Future<void> deleteData(String id) async {
    await _db.collection('notes').doc(id).delete();
  }
}
