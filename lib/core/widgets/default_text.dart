import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget defaultText({
  required TextInputType type,
  TextEditingController? controller,
  Function(String)? onChanged,
  String? Function(String?)? validate,
  bool isObscure = false,
  String? label,
  String? hint,
  IconData? prefixIcon,
  IconData? suffixIcon,
  VoidCallback? suffixPressed,
  required BuildContext context,
  Color? color,
}) {
  return TextFormField(
    keyboardType: type,
    controller: controller,
    obscureText: isObscure,
    onChanged: onChanged,
    validator: validate,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        color: color ?? Theme.of(context).colorScheme.secondary,
      ),
      hintText: hint,
      hintStyle: TextStyle(
        color: color ?? Theme.of(context).colorScheme.secondary,
      ),
      prefixIcon: prefixIcon == null
          ? null
          : Icon(
              prefixIcon,
              color: Theme.of(context).colorScheme.secondary,
            ),
      suffixIcon: suffixIcon == null
          ? null
          : IconButton(
              onPressed: suffixPressed,
              icon: Icon(
                suffixIcon,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
    ),
    style: TextStyle(
      fontSize: 14,
      color: color ?? Theme.of(context).colorScheme.secondary,
    ),
  );
}
