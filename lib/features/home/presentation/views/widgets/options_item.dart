import 'package:flutter/material.dart';

class OptionsItem extends StatelessWidget {
  const OptionsItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.color,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: color,
          ),
        ),
      ),
    );
  }
}
