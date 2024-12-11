import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar(
      {super.key, required this.selectedIndex, required this.onTap});
  final int selectedIndex;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      selectedItemColor: AppColors.primaryColor,
      unselectedIconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
      currentIndex: selectedIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat,
          ),
          label: 'Chats',
          tooltip: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.tips_and_updates_rounded,
          ),
          label: 'Status',
          tooltip: 'Status',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.call,
          ),
          label: 'Calls',
          tooltip: 'Calls',
        ),
      ],
    );
  }
}
