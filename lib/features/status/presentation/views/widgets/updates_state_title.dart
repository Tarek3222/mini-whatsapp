import 'package:flutter/material.dart';

class UpdatesStateTitle extends StatelessWidget {
  const UpdatesStateTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 20, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey.withOpacity(0.7),
        ),
      ),
    );
  }
}
