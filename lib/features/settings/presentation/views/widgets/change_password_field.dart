import 'package:clone_chat/core/widgets/default_text.dart';
import 'package:flutter/material.dart';

class ChangePasswordField extends StatelessWidget {
  const ChangePasswordField({
    super.key,
    required this.passwordController,
    required this.isPasswordVisible,
    required this.togglePasswordVisibility,
    required this.label,
    required this.hint,
    this.validate,
  });
  final TextEditingController passwordController;
  final bool isPasswordVisible;
  final VoidCallback togglePasswordVisibility;
  final String label;
  final String hint;
  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return defaultText(
      context: context,
      type: TextInputType.visiblePassword,
      label: label,
      hint: hint,
      controller: passwordController,
      isObscure: isPasswordVisible,
      validate: validate,
      prefixIcon: Icons.lock,
      suffixIcon: isPasswordVisible ? Icons.visibility_off : Icons.visibility,
      suffixPressed: togglePasswordVisibility,
    );
  }
}
