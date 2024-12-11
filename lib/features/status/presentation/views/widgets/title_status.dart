import 'package:flutter/material.dart';

class TitleStatus extends StatelessWidget {
  const TitleStatus({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
