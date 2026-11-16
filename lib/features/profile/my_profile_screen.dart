import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripora/core/theme/app_colors.dart';

import 'package:tripora/features/profile/cubit/profile_cubit.dart';
import 'package:tripora/features/profile/cubit/profile_state.dart';
import 'package:tripora/features/profile/validator.dart';
import 'package:tripora/features/profile/widgets/custom_eleveted_button.dart';
import 'package:tripora/features/profile/widgets/custom_text_form_field.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    final user = context.read<ProfileCubit>().userData;

    if (user != null) {
      nameController.text = user['name'] ?? '';
      mobileController.text = user['phone'] ?? '';
      emailController.text = user['email'] ?? '';
    }
  }

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      if (!mounted) return;

      context.read<ProfileCubit>().setImage(File(image.path));
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Profile', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),

      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdateSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile Updated Successfully')),
            );

            Navigator.pop(context);
          }

          if (state is ProfileErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.msg)));
          }
        },

        child: Form(
          key: formKey,
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: pickImage,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xffF8D0D0),
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          final image = context
                              .read<ProfileCubit>()
                              .profileImage;

                          if (image != null) {
                            return Image.file(image, fit: BoxFit.cover);
                          }

                          return const Icon(
                            Icons.person,
                            size: 55,
                            color: AppColors.darkRed,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.04),

              CustomTextFormField(
                lable: 'Mobile Number',
                hintText: 'Mobile Number',
                controller: mobileController,
                keyboardType: TextInputType.phone,
                validator: Validators.phoneValidator,
              ),

              CustomTextFormField(
                lable: 'Name',
                hintText: 'Name',
                controller: nameController,
                keyboardType: TextInputType.name,
                validator: Validators.name,
              ),

              CustomTextFormField(
                lable: 'Email',
                hintText: 'Enter your Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validators.email,
              ),

              const Spacer(),

              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoadingState) {
                    return const CircularProgressIndicator();
                  }

                  return CustomElevatedButton(
                    text: 'Save',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<ProfileCubit>().updateProfile(
                          name: nameController.text.trim(),
                          phone: mobileController.text.trim(),
                          email: emailController.text.trim(),
                        );
                      }
                    },
                  );
                },
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
