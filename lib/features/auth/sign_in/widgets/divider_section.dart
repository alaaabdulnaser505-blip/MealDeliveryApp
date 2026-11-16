import 'package:flutter/material.dart';
import 'package:tripora/core/theme/app_colors.dart';

Widget buildDivider() {
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
