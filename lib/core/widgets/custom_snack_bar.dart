import 'package:flutter/material.dart';

SnackBar customSnackBar({required String text}) {
  return SnackBar(
    content: FittedBox(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    ),
    duration: const Duration(seconds: 2),
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    margin: const EdgeInsets.all(20),
  );
}
