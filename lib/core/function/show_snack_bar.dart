import 'package:clone_chat/core/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';

void showSnackBar(
  context, {
  required String message,
  EdgeInsetsGeometry? margin,
  Color? color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    customSnackBar(text: message, margin: margin, color: color),
  );
}
