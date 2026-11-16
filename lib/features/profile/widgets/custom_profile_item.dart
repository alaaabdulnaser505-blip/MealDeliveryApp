import 'package:flutter/material.dart';

class CustomProfileItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onTap;

  const CustomProfileItem({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 53,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xffDDDDDD), width: 1),
          ),
        ),
        child: Row(
          children: [
            Image.asset(image, width: 22, height: 22, fit: BoxFit.contain),

            const SizedBox(width: 16),

            Text(
              title,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),

            const Spacer(),

            const Icon(Icons.arrow_forward_ios, size: 17, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
