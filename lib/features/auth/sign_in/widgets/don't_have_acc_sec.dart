import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripora/core/routing/app_routes.dart';
import 'package:tripora/core/theme/app_colors.dart';

Widget buildSignUpSection(BuildContext context) {
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
