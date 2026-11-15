import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tripora/core/routing/app_routes.dart';
import 'package:tripora/core/theme/app_colors.dart';
import 'package:tripora/core/validator/validator.dart';
import 'package:tripora/features/auth/sign_in/cubit/signin_cubit.dart';
import 'package:tripora/features/auth/sign_in/cubit/signin_state.dart';
import 'package:tripora/features/auth/widgets/primary_buuton.dart';
import 'package:tripora/features/auth/widgets/text_form_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {

  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  leading: IconButton(
    onPressed: () {
      context.go(AppRouter.signIn);
    },
    icon: const Icon(Icons.arrow_back),
  ),
  title: const Text('Forgot Password'),
),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),

                const Icon(
                  Icons.lock_reset,
                  size: 80,
                  color: AppColors.darkRed,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Reset Your Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Enter your email address and we will send '
                  'you a link to reset your password.',
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                CustomTextFormField(
                  validator: AppValidator.validateEmail,
                  controller: email,
                  hint: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  obsc: false,
                ),

                const SizedBox(height: 25),

                BlocConsumer<SignInCubit, SignInState>(
                 listener: (context, state) {
  if (state is ResetPasswordSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Password reset link sent to your email',
        ),
      ),
    );

    context.go(AppRouter.signIn);
  }

  if (state is ResetPasswordFailure) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(state.error),
      ),
    );
  }
},
                  builder: (context, state) {
                    return PrimaryButton(
                      text: state is ResetPasswordLoading
                          ? 'Please wait...'
                          : 'Send Reset Link',
                      onpress: state is ResetPasswordLoading
                          ? () {}
                          : () {
                              if (formKey.currentState!.validate()) {
                                context
                                    .read<SignInCubit>()
                                    .resetPassword(email.text.trim());
                              }
                            },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}