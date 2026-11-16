
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailure extends SignInState {
  final String error;

  SignInFailure(this.error);
}

class ResetPasswordLoading extends SignInState {}

class ResetPasswordSuccess extends SignInState {}

class ResetPasswordFailure extends SignInState {
  final String error;

  ResetPasswordFailure(this.error);
}
