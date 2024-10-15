import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:clone_chat/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width,
    this.height = 55,
    required this.text,
    this.backgroundColor,
    required this.onPressed,
    this.textColor,
    this.borderRadius,
    this.fontSize,
  });
  final double? width;
  final double? height;
  final String text;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final Color? textColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        minimumSize: Size(width ?? double.infinity, height!),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(24),
        ),
      ),
      child: Text(
        text,
        style: Styles.textStyle24.copyWith(
          color: textColor ?? Colors.black,
          fontSize: fontSize ?? 24,
        ),
      ),
    );
  }
}
