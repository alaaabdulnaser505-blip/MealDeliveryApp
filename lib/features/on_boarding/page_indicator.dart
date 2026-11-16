import 'package:flutter/material.dart';
import 'package:tripora/core/theme/app_colors.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.onboardingData,
    required this.currentIndex,
  });

  final List<Map<String, dynamic>> onboardingData;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingData.length,
        (index) {
          final isSelected = currentIndex == index;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: isSelected ? 24 : 8,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.darkRed : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }
}
