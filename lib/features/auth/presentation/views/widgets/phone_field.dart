import 'package:clone_chat/core/widgets/default_text.dart';
import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key, required this.phoneController});
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return defaultText(
      context: context,
      type: TextInputType.phone,
      label: 'Phone Number',
      hint: 'Enter your phone number',
      controller: phoneController,
      validate: (value) {
        if (value!.isEmpty) {
          return 'phone number must not be empty';
        }
        return null;
      },
      prefixIcon: Icons.phone_android,
    );
  }
}
