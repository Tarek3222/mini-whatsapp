import 'package:clone_chat/core/widgets/default_text.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.emailController});
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return defaultText(
      context: context,
      type: TextInputType.emailAddress,
      label: 'Email Address',
      hint: 'Enter your email address',
      controller: emailController,
      validate: (value) {
        if (value!.isEmpty) {
          return 'Please enter your email address';
        }
        return null;
      },
      prefixIcon: Icons.email,
    );
  }
}
