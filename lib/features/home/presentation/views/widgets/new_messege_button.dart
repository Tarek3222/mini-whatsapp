import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class NewMessegeButton extends StatelessWidget {
  const NewMessegeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: AppColors.primaryColor,
      child: const Icon(
        Icons.message,
        color: Colors.white,
      ),
    );
  }
}
