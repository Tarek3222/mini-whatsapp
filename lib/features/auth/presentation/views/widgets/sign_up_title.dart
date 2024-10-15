import 'package:clone_chat/core/themes/styles.dart';
import 'package:flutter/material.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: const Text(
        'Register To New Account',
        style: Styles.textStyle24,
        textAlign: TextAlign.center,
      ),
    );
  }
}
