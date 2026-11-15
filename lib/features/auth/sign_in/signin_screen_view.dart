
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:tripora/core/routing/app_routes.dart';
import 'package:tripora/core/theme/app_colors.dart';
import 'package:tripora/core/validator/validator.dart';
import 'package:tripora/features/auth/forgot_password/forgot_password_screen.dart';
import 'package:tripora/features/auth/sign_in/cubit/signin_cubit.dart';
import 'package:tripora/features/auth/sign_in/cubit/signin_state.dart';
import 'package:tripora/features/auth/sign_in/widgets/divider_Section.dart';
import 'package:tripora/features/auth/sign_in/widgets/form_field_Sec.dart';
import 'package:tripora/features/auth/sign_in/widgets/header_section.dart';



import 'package:tripora/features/auth/sign_in/widgets/social_login_widget.dart';


import 'package:tripora/features/auth/widgets/primary_buuton.dart';
import 'package:tripora/features/auth/widgets/text_form_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final formKeySignIn = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: _handleSignInState,
      builder: (context, state) {
        return Scaffold(
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
                        key: formKeySignIn,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: height*0.1),
                           
                           AuthHeader(title: 'SignIn'),

                            SizedBox(height: height * 0.05),

                            
                           AuthFormFields(height: height, emailController: email, passwordController: password),

                            SizedBox(height: height * 0.015),

                            
                       _buildForgotPassword(context),

                            SizedBox(height: height * 0.035),

                            
                            _buildSignInButton(context, state),

                            SizedBox(height: height * 0.04),

                           
                            buildDivider(),

                            SizedBox(height: height * 0.03),

                           
                            buildSocialSection(),

                            SizedBox(height: height * 0.04),

                         
                      _buildSignUpSection(context)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  // 1. Header Section

Widget _buildSignUpSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          child: Text(
            "Don't have an account?",
            maxLines: 1,
            style: TextStyle(color: AppColors.blackGrey),
          ),
        ),
        TextButton(
          onPressed: () {
            context.go(AppRouter.signUp);
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(color: AppColors.darkRed),
          ),
        ),
      ],
    );
  }

 
  // 3. Forgot Password Section
 Widget _buildForgotPassword(BuildContext context) {
  return Align(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () {
        context.go(AppRouter.forgotPassword);
      },
      child: const Text(
        'Forgot Password?',
        style: TextStyle(color: AppColors.darkRed),
      ),
    ),
  );
}

 

 Widget _buildSignInButton(
    BuildContext context,
    SignInState state,
  ) {
    final isLoading = state is SignInLoading;

    return PrimaryButton(
      text: isLoading ? 'Please wait...' : 'Sign In',
      onpress: isLoading
          ? () {}
          : () {
              if (formKeySignIn.currentState!.validate()) {
                context.read<SignInCubit>().signIn(
                      email.text.trim(),
                      password.text,
                    );
              }
            },
    );
  }
  

  
  void _handleSignInState(BuildContext context, SignInState state) {
    if (state is SignInSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sign In Successful'),
        ),
      );

      //home route
    } else if (state is SignInFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error),
        ),
      );
    } else if (state is ResetPasswordSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset email sent successfully'),
        ),
      );
    } else if (state is ResetPasswordFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error),
        ),
      );
    }
  }
}
