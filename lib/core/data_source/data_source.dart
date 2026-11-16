//import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//import 'package:tripora/features/auth/models/user_model.dart';

//class DataSource {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//  Future<void> signUp(String email, String pass, String name) async {
// try {
//   UserCredential userCredential = await _auth
//       .createUserWithEmailAndPassword(
//     email: email,
//     password: pass,
//   );

//   await _firestore
//  .collection("users")
//   .doc(userCredential.user!.uid)
//  .set(
//    UserModel(
//    name: name,
//    email: email,
//    favData: [],
//    myOrder: [],
//  ).tojson(),
// );

//} catch (e) {
//   print(e);
//  }
//}
//}

//   Future<void> signIn(String email, String pass) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: pass);
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> resetPass(String email) async {
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> signOut() async {
//     try {
//       await _auth.signOut();
//     } catch (e) {
//       print(e);
//     }
//   }

// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tripora/features/auth/models/user_model.dart';

class DataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign Up
  Future<void> signUp(String email, String pass, String name) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: pass);

      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(
            UserModel(
              name: name,
              email: email,
              phone: '',
              address: '',
              favData: [],
              myOrder: [],
            ).tojson(),
          );
    } catch (e) {
      print('Sign Up Error: $e');
      rethrow;
    }
  }

  Future<void> signIn(String email, String pass) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
    } catch (e) {
      print('Sign In Error: $e');
      rethrow;
    }
  }

  Future<void> resetPass(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('Reset Password Error: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getUserData() async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        throw Exception('No user logged in');
      }

      final userDoc = await _firestore.collection('users').doc(user.uid).get();

      return userDoc.data();
    } catch (e) {
      print('Get User Data Error: $e');
      rethrow;
    }
  }

  Future<void> updateProfile({
    required String name,
    required String phone,
    required String email,
  }) async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        throw Exception('No user logged in');
      }

      // Update email in Firebase Authentication
      if (user.email != email) {
        await _auth.currentUser!.verifyBeforeUpdateEmail(email);
      }

      // Update data in Firestore
      await _firestore.collection('users').doc(user.uid).update({
        'name': name,
        'phone': phone,
        'email': email,
      });
    } catch (e) {
      print('Update Profile Error: $e');
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Sign Out Error: $e');
      rethrow;
    }
  }
}
