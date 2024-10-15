import 'package:clone_chat/core/function/show_snack_bar.dart';
import 'package:clone_chat/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onSuccess,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      borderRadius: BorderRadius.circular(22),
      text: 'Log In',
      onPressed: () {
        if (!emailController.text.contains('@')) {
          showSnackBar(context, message: 'Please enter a valid email');
        } else if (passwordController.text.length < 8) {
          showSnackBar(context, message: 'The password provided is too weak');
        } else {
          onSuccess();
        }
      },
    );
  }
}
