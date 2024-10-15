import 'package:clone_chat/core/widgets/default_text.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField(
      {super.key,
      required this.passwordController,
      required this.isPasswordVisible,
      required this.togglePasswordVisibility});
  final TextEditingController passwordController;
  final bool isPasswordVisible;
  final VoidCallback togglePasswordVisibility;

  @override
  Widget build(BuildContext context) {
    return defaultText(
      type: TextInputType.visiblePassword,
      label: 'Password',
      hint: 'Enter your password',
      controller: passwordController,
      isObscure: isPasswordVisible,
      validate: (value) {
        if (value!.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
      prefixIcon: Icons.lock,
      suffixIcon: isPasswordVisible ? Icons.visibility_off : Icons.visibility,
      suffixPressed: togglePasswordVisibility,
    );
  }
}
