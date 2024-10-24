import 'package:clone_chat/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:clone_chat/features/profile/presentation/views/widgets/profile_information.dart';
import 'package:clone_chat/features/profile/presentation/views/widgets/save_profile_button.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const ProfileImage(),
          const Divider(
            height: 70,
          ),
          ProfileInformation(
            nameController: nameController,
            phoneController: phoneController,
          ),
          const SizedBox(
            height: 45,
          ),
          SaveProfileButton(),
        ],
      ),
    );
  }
}
