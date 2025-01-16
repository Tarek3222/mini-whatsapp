import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar(
      {super.key, required this.selectedIndex, required this.onTap});
  final int selectedIndex;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      index: selectedIndex,
      onTap: onTap,
      buttonBackgroundColor: AppColors.primaryColor,
      color: AppColors.primaryColor,
      animationDuration: const Duration(milliseconds: 300),
      height: 60.h,
      items: const [
        Icon(
          Icons.chat,
          color: Colors.white,
        ),
        Icon(
          Icons.tips_and_updates,
          color: Colors.white,
        ),
        Icon(
          Icons.group,
          color: Colors.white,
        ),
        Icon(
          Icons.call,
          color: Colors.white,
        ),
      ],
    );
  }
}
