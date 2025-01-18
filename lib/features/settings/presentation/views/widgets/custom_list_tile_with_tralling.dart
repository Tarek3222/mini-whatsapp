import 'package:clone_chat/core/themes/styles.dart';
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
        color: Theme.of(context).colorScheme.secondary,
        size: 30,
      ),
      title: Text(
        title,
        style: Styles.font22Bold(context),
      ),
      trailing: Switch(
        value: switchValue,
        activeColor: Theme.of(context).colorScheme.primary,
        inactiveTrackColor: Colors.grey,
        onChanged: onChanged,
      ),
    );
  }
}
