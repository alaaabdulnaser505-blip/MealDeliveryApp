import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  File? profileImage;

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
