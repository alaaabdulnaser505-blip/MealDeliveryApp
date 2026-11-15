
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:tripora/core/routing/app_routes.dart';
import 'package:tripora/core/theme/app_colors.dart';
import 'package:tripora/core/validator/validator.dart';
import 'package:tripora/features/auth/sign_in/widgets/social_login_widget.dart';
import 'package:tripora/features/auth/sign_up/cubit/signup_cubit.dart';
import 'package:tripora/features/auth/sign_up/cubit/signup_state.dart';
import 'package:tripora/features/auth/widgets/auth_header_sec.dart';
import 'package:tripora/features/auth/widgets/primary_buuton.dart';
import 'package:tripora/features/auth/widgets/text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final formKeySign = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool isLoadingDialogOpen = false;

  @override
  void dispose() {
    email.dispose();
    name.dispose();
    password.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: _handleSignUpState,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: LayoutBuilder(
            
builder: (context, constraints) {
  final width = constraints.maxWidth;
  final height = constraints.maxHeight;
  final isTablet = width >= 600;

  return SingleChildScrollView(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 24,
    ),
    child: Center(
      child: SizedBox(
        width: isTablet ? 450 : width * 0.9,
        child: Form(
          key: formKeySign,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               SizedBox(height: height * 0.1),
          
             AuthHeader(title: 'SignUP'),

              SizedBox(height: height * 0.035),

           
              _buildFormFields(height),

              SizedBox(height: height * 0.04),

              
              _buildSignUpButton(context),

              SizedBox(height: height * 0.04),

            
              _buildDivider(),

              SizedBox(height: height * 0.025),

            
              buildSocialSection(),

              SizedBox(height: height * 0.035),

          
              _buildLoginSection(context),
            ],
          ),
        ),
      ),
    ),
  );
},

          ),
        ),
      ),
    );
  }

 



  // 2. Form Fields Section
  Widget _buildFormFields(double height) {
    return Column(
      children: [
        CustomTextFormField(
          validator: AppValidator.validateEmail,
          controller: email,
          hint: 'Email',
          prefixIcon: const Icon(Icons.email_outlined, size: 17),
          obsc: false,
        ),

        SizedBox(height: height * 0.025),

        CustomTextFormField(
          validator: AppValidator.validateName,
          controller: name,
          hint: 'Name',
          prefixIcon: const Icon(Icons.person_outline, size: 17),
          obsc: false,
        ),

        SizedBox(height: height * 0.025),

        CustomTextFormField(
          validator: AppValidator.validatePassword,
          controller: password,
          hint: 'Password',
          prefixIcon: const Icon(Icons.key_outlined, size: 17),
          obsc: true,
        ),
      ],
    );
  }

  // 3. Sign Up Button Section
  Widget _buildSignUpButton(BuildContext context) {
    return PrimaryButton(
      text: 'Sign Up',
      onpress: () {
        if (formKeySign.currentState!.validate()) {
          context.read<SignUpCubit>().signUP(
                email.text.trim(),
                password.text,
                name.text.trim(),
              );
        }
      },
    );
  }

  // 4. Divider Section
  Widget _buildDivider() {
    return const Row(
      children: [
        Expanded(child: Divider(color: AppColors.blackGrey,)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Or continue with',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.blackGrey,
            ),
          ),
        ),
        Expanded(child: Divider(color: AppColors.blackGrey,)),
      ],
    );
  }

  // 5. Social Login Section
 

  // 6. Login Navigation Section
  Widget _buildLoginSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          child: Text(
            'Already have an account?',
            maxLines: 1,
            style: TextStyle(color: AppColors.blackGrey),
          ),
        ),
        TextButton(
          onPressed: () {
            context.go(AppRouter.signIn);
          },
          child: const Text(
            'Login',
            style: TextStyle(color: AppColors.darkRed),
          ),
        ),
      ],
    );
  }

  // 7. Handle Cubit States
  void _handleSignUpState(BuildContext context, SignUpState state) {
    if (state is SignUpLoading) {
      if (!isLoadingDialogOpen) {
        isLoadingDialogOpen = true;

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    } else if (state is SignUpSuccess) {
      _closeLoadingDialog();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign Up Successful')),
      );

      context.go(AppRouter.signIn);
    } else if (state is SignUpFailure) {
      _closeLoadingDialog();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign Up Failed: ${state.error}'),
        ),
      );
    }
  }

  // Close Loading Dialog
  void _closeLoadingDialog() {
    if (isLoadingDialogOpen) {
      isLoadingDialogOpen = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
