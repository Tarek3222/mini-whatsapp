import 'package:flutter/material.dart';

class TimeStatusToUpload extends StatelessWidget {
  const TimeStatusToUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Today, 12:30 pm',
      style: TextStyle(
        color: Colors.grey.withOpacity(0.7),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
