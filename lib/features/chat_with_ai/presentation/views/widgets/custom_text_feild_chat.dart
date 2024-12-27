// ignore_for_file: deprecated_member_use

import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:clone_chat/core/themes/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFeildChat extends StatelessWidget {
  const CustomTextFeildChat({
    super.key,
    required this.hintTitle,
    required this.textEditingController,
    required this.focusNode,
    this.onChanged,
  });
  final String hintTitle;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChanged,
      controller: textEditingController,

      maxLines: null, // Allows the field to grow dynamically
      style: Styles.font18Medium(context).copyWith(
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      decoration: InputDecoration(
        hintText: hintTitle,
        hintStyle: Styles.font18Medium(context)
            .copyWith(color: const Color(0xff626262)),
        fillColor: const Color(0xffF1F4FF),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
      ),
      cursorColor: AppColors.primaryColor,
    );
  }
}
