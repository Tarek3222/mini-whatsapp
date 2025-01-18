import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      this.color});
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: color ?? Theme.of(context).colorScheme.secondary,
        size: 35,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: color ?? Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
