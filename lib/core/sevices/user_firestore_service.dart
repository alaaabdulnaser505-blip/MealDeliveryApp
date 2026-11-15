import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserFirestoreService {
  final FirebaseFirestore _db;
  final FirebaseAuth _auth;

  UserFirestoreService({FirebaseFirestore? db, FirebaseAuth? auth})
    : _db = db ?? FirebaseFirestore.instance,
      _auth = auth ?? FirebaseAuth.instance;

  String get uid {
    final user = _auth.currentUser;
    if (user == null) throw Exception('User not signed in');
    return user.uid;
  }

  DocumentReference<Map<String, dynamic>> get userDoc =>
      _db.collection('users').doc(uid);
  CollectionReference<Map<String, dynamic>> get orderCollection =>
      userDoc.collection('orders');
  CollectionReference<Map<String, dynamic>> get cartCollection =>
      userDoc.collection('cart');
}
