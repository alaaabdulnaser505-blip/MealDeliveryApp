import 'package:flutter/material.dart';

import 'package:tripora/core/validator/validator.dart';
import 'package:tripora/features/auth/widgets/text_form_field.dart';

class AuthFormFields extends StatelessWidget {
  final double height;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const AuthFormFields({
    super.key,
    required this.height,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          validator: AppValidator.validateEmail,
          controller: emailController,
          hint: 'Email',
          prefixIcon: const Icon(Icons.email_outlined, size: 17),
          obsc: false,
        ),

        SizedBox(height: height * 0.03),

        CustomTextFormField(
          validator: AppValidator.validatePassword,
          controller: passwordController,
          hint: 'Password',
          prefixIcon: const Icon(Icons.key_outlined, size: 17),
          obsc: true,
        ),
      ],
    );
  }
}