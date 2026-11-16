import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripora/core/data_source/data_source.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final DataSource dataSource = DataSource();

  ProfileCubit() : super(ProfileInitialState());

  File? profileImage;

  Map<String, dynamic>? userData;

  // Get User Data
  Future<void> getUserData() async {
    try {
      emit(ProfileLoadingState());

      userData = await dataSource.getUserData();

      if (userData != null) {
        emit(ProfileDataLoadedState(userData: userData!));
      }
    } catch (e) {
      emit(ProfileErrorState(msg: e.toString()));
    }
  }

  // Update User Data
  Future<void> updateProfile({
    required String name,
    required String phone,
    required String email,
  }) async {
    try {
      emit(ProfileLoadingState());

      await dataSource.updateProfile(name: name, phone: phone, email: email);

      userData = {...?userData, 'name': name, 'phone': phone, 'email': email};

      emit(ProfileUpdateSuccessState());
    } catch (e) {
      emit(ProfileErrorState(msg: e.toString()));
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await dataSource.signOut();
      profileImage = null;
      userData = null;
      emit(ProfileLogoutSuccess());
    } catch (e) {
      emit(ProfileErrorState(msg: e.toString()));
    }
  }

  // Set Profile Image
  void setImage(File image) {
    emit(ProfileLoadingState());

    try {
      profileImage = image;
      emit(ProfileSuccessState(image: image));
    } catch (e) {
      emit(ProfileErrorState(msg: e.toString()));
    }
  }
}
