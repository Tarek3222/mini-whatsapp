import 'package:clone_chat/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.onSuccess});
  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      borderRadius: BorderRadius.circular(22),
      text: 'Sign Up',
      onPressed: onSuccess,
    );
  }
}
