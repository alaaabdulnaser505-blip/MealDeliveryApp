import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tripora/core/theme/app_colors.dart';
import 'package:tripora/core/theme/app_text_styles.dart';
import 'package:tripora/features/profile/address_book.dart';
import 'package:tripora/features/profile/cubit/profile_cubit.dart';
import 'package:tripora/features/profile/cubit/profile_state.dart';
import 'package:tripora/features/profile/my_profile_screen.dart';
import 'package:tripora/features/profile/widgets/custom_profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUserData(),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();

    context.read<ProfileCubit>().getUserData();
  }

  void openMyProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<ProfileCubit>(),
          child: const MyProfileScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                // Profile Header
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    final cubit = context.read<ProfileCubit>();
                    final user = cubit.userData;
                    final image = cubit.profileImage;

                    if (state is ProfileLoadingState && user == null) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is ProfileErrorState && user == null) {
                      return Center(child: Text(state.msg));
                    }

                    return Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: openMyProfile,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: const Color(0xffF8D0D0),
                              backgroundImage: image != null
                                  ? FileImage(image)
                                  : null,
                              child: image == null
                                  ? const Icon(
                                      Icons.person,
                                      size: 55,
                                      color: Color(0xffBD2529),
                                    )
                                  : null,
                            ),
                          ),

                          Text(
                            user?['name'] ?? '',
                            style: AppTextStyles.heading1,
                          ),

                          Text(
                            user?['phone'] ?? '',
                            style: AppTextStyles.title,
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                CustomProfileItem(
                  image: 'assets/images/profile_icon.png',
                  title: 'My Profile',
                  onTap: openMyProfile,
                ),

                CustomProfileItem(
                  image: 'assets/images/location_icon.png',
                  title: 'Address Book',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddressBook()),
                    );
                  },
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

                const SizedBox(height: 15),

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
                        context.read<ProfileCubit>().logout();
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
