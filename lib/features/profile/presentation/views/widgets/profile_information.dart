import 'package:clone_chat/features/profile/presentation/views/widgets/label_field.dart';
import 'package:clone_chat/features/profile/presentation/views/widgets/name_field.dart';
import 'package:clone_chat/features/profile/presentation/views/widgets/phone_field.dart';
import 'package:flutter/material.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation(
      {super.key, required this.nameController, required this.phoneController});
  final TextEditingController nameController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: LabelField(label: 'Name'),
          ),
          const SizedBox(height: 10),
          NameField(
            nameController: nameController,
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: LabelField(label: 'Phone'),
          ),
          const SizedBox(height: 10),
          PhoneField(
            phoneController: phoneController,
          ),
        ],
      ),
    );
  }
}
