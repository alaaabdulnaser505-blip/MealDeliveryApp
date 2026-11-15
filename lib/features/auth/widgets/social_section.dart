
import 'package:flutter/material.dart';

Widget buildSocialSection() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.g_mobiledata, size: 30),
        SizedBox(width: 20),
        Icon(Icons.apple),
        SizedBox(width: 20),
        Icon(Icons.facebook),
      ],
    );
  }