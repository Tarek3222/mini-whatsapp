import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomListTileWithTralling extends StatelessWidget {
  const CustomListTileWithTralling(
      {super.key,
      required this.icon,
      required this.title,
      required this.switchValue,
      required this.onChanged});
  final IconData icon;
  final String title;
  final bool switchValue;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black54,
        size: 35,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Switch(
        value: switchValue,
        activeColor: AppColors.primaryColor,
        inactiveTrackColor: Colors.grey,
        onChanged: onChanged,
      ),
    );
  }
}
