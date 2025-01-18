import 'package:flutter/material.dart';

class ProfileViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.green,
      ),
      title: Text(
        'Profile',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
