import 'package:flutter/material.dart';
import 'package:tripora/core/theme/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final TextStyle? textStyle;
  final Widget? icon;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,

    this.textStyle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var label = Text(
      text,
      style:
          textStyle ??
          Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: AppColors.white),
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkRed,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: onPressed,
        child: icon == null
            ? label
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [icon!, SizedBox(width: 18), label],
              ),
      ),
    );
  }
}
