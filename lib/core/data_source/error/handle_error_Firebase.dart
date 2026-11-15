import 'package:firebase_auth/firebase_auth.dart';

String getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No account found with this email.';

      case 'wrong-password':
        return 'Incorrect password.';

      case 'invalid-email':
        return 'Please enter a valid email.';

      case 'invalid-credential':
        return 'Email or password is incorrect.';

      case 'user-disabled':
        return 'This account has been disabled.';

      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';

      default:
        return e.message ?? 'Authentication failed.';
    }
  }