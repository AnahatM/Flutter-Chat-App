import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  // Get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore
        .collection('Users')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  // Send Message

  // Get messages
}
