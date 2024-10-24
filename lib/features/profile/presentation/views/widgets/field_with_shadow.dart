import 'package:flutter/material.dart';

class FieldWithShadow extends StatelessWidget {
  const FieldWithShadow({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 30,
      shadowColor: Colors.white.withOpacity(0.7),
      borderRadius: BorderRadius.circular(30),
      child: child,
    );
  }
}
