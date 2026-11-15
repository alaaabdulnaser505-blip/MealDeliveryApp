import 'dart:io';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final File image;

  ProfileSuccessState({required this.image});
}

class ProfileErrorState extends ProfileState {
  final String msg;

  ProfileErrorState({required this.msg});
}
