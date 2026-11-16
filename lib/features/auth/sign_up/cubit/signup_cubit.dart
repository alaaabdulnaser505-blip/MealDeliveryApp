

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripora/core/data_source/data_source.dart';
import 'package:tripora/features/auth/sign_up/cubit/signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
 final DataSource dataSource = DataSource();
  Future<void> signUP(String email, String pass, String name) async {
    emit(SignUpLoading());
    try {
      await dataSource.signUp(email, pass, name);
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }
}
