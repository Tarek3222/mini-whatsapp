import 'package:clone_chat/core/themes/styles.dart';
import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        'Log in to your account',
        style: Styles.textStyle24,
        textAlign: TextAlign.center,
      ),
    );
  }
}
