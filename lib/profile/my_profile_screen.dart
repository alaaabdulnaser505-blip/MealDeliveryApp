import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripora/core/theme/app_colors.dart';
import 'package:tripora/profile/cubit/profile_cubit.dart';
import 'package:tripora/profile/cubit/profile_state.dart';
import 'package:tripora/profile/widgets/custom_eleveted_button.dart';
import 'package:tripora/profile/widgets/custom_text_form_field.dart';
import 'package:tripora/profile/widgets/validator.dart';

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
        title: const Text('My Profile'),
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
      body: Form(
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
                        final image = context.read<ProfileCubit>().profileImage;

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
              lable: ' Name',
              hintText: 'Name',
              controller: nameController,
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
            CustomElevatedButton(
              text: 'save',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Handle save action
                }
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
