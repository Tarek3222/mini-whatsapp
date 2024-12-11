import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class NewStatusButton extends StatelessWidget {
  const NewStatusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: AppColors.primaryColor,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
