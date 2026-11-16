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

class ProfileLogoutSuccess extends ProfileState {}

// Get User Data
class ProfileDataLoadedState extends ProfileState {
  final Map<String, dynamic> userData;

  ProfileDataLoadedState({required this.userData});
}

// Update User Data
class ProfileUpdateSuccessState extends ProfileState {}
