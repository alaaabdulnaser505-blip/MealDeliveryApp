import 'package:flutter/material.dart';

import 'package:tripora/core/theme/app_colors.dart';

class AuthHeader extends StatelessWidget {
  final String title;

  const AuthHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: AppColors.darkRed,
            fontSize: 28,
          ),
    );
  }
}