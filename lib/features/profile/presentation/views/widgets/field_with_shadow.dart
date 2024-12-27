// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class FieldWithShadow extends StatelessWidget {
  const FieldWithShadow({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.secondary,
      elevation: 0.3,
      shadowColor: Colors.white.withOpacity(0.7),
      borderRadius: BorderRadius.circular(30),
      child: child,
    );
  }
}
