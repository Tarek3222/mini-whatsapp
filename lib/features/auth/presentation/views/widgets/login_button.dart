import 'package:clone_chat/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      borderRadius: BorderRadius.circular(22),
      text: text,
      onPressed: onTap,
    );
  }
}
