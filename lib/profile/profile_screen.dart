import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:tripora/core/theme/app_colors.dart';
import 'package:tripora/core/theme/app_text_styles.dart';
import 'package:tripora/profile/my_profile_screen.dart';
import 'package:tripora/profile/widgets/custom_profile_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final result = await Navigator.push<File?>(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MyProfileScreen(profileImage: profileImage),
                            ),
                          );

                          if (result != null) {
                            setState(() {
                              profileImage = result;
                            });
                          }
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: const Color(0xffF8D0D0),
                          backgroundImage: profileImage != null
                              ? FileImage(profileImage!)
                              : null,
                          child: profileImage == null
                              ? const Icon(
                                  Icons.person,
                                  size: 55,
                                  color: Color(0xffBD2529),
                                )
                              : null,
                        ),
                      ),
                      Text('Sandrica', style: AppTextStyles.heading1),
                      Text('0101011', style: AppTextStyles.title),
                    ],
                  ),
                ),
                CustomProfileItem(
                  image: 'assets/images/profile_icon.png',
                  title: 'My Profile',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyProfileScreen(),
                      ),
                    );
                  },
                ),
                CustomProfileItem(
                  image: 'assets/images/location_icon.png',
                  title: 'Address Book',
                ),
                CustomProfileItem(
                  image: 'assets/images/payment_icon.png',
                  title: 'Payment Methods',
                ),
                CustomProfileItem(
                  image: 'assets/images/my_orders_icon.png',
                  title: 'My Orders',
                ),
                CustomProfileItem(
                  image: 'assets/images/preferences_icon.png',
                  title: 'Preferences',
                ),
                CustomProfileItem(
                  image: 'assets/images/settings_icon.png',
                  title: 'Notification Settings',
                ),
                CustomProfileItem(
                  image: 'assets/images/help_icon.png',
                  title: 'Help & FAQ',
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/logout_icon.png',
                      width: 22,
                      height: 22,
                      fit: BoxFit.contain,
                    ),

                    TextButton(
                      onPressed: () {
                        // Handle logout action
                      },
                      child: Text(
                        'Logout',
                        style: AppTextStyles.text1.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
