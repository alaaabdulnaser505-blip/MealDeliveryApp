import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripora/core/data_source/error/handle_error_Firebase.dart';

import 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(String email, String password) async {
    emit(SignInLoading());

    try {
      await auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignInFailure(getErrorMessage(e)));
    } catch (e) {
      emit(SignInFailure('Something went wrong. Please try again.'));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(ResetPasswordLoading());

    try {
      await auth.sendPasswordResetEmail(email: email.trim());

      emit(ResetPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      emit(ResetPasswordFailure(getErrorMessage(e)));
    } catch (e) {
      emit(ResetPasswordFailure('Something went wrong. Please try again.'));
    }
  }
}
