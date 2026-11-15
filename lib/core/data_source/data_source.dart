// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:tripora/features/auth/models/user_model.dart';

// class DataSource {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   Future<void> signUp(String email, String pass, String name) async {
//   try {
//     UserCredential userCredential = await _auth
//         .createUserWithEmailAndPassword(
//       email: email,
//       password: pass,
//     );

//     await _firestore
//         .collection("users")
//         .doc(userCredential.user!.uid)
//         .set(
//           UserModel(
//             name: name,
//             email: email,
//             favData: [],
//             myOrder: [],
//           ).tojson(),
//         );

//   } catch (e) {
//     print(e);
//   }
// }

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
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

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
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
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

  // Update Profile
  // Future<void> updateProfile({
  //   required String name,
  //   required String phone,
  //   required String address,
  // }) async {
  //   try {
  //     final userId = _auth.currentUser!.uid;

  //     await _firestore.collection('users').doc(userId).update({
  //       'name': name,
  //       'phone': phone,
  //       'address': address,
  //     });
  //   } catch (e) {
  //     print('Update Profile Error: $e');
  //     rethrow;
  //   }
  // }


  

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Sign Out Error: $e');
      rethrow;
    }
  }
}