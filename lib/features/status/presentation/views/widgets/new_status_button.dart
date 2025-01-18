import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewStatusButton extends StatelessWidget {
  const NewStatusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        GoRouter.of(context).push(AppRouters.kAddNewStatusView);
      },
      backgroundColor: AppColors.primaryColor,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
