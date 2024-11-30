import 'package:clone_chat/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onTap,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      borderRadius: BorderRadius.circular(22),
      text: 'Log In',
      onPressed: onTap,
    );
  }
}
