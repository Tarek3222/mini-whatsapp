import 'package:flutter/material.dart';

class BuildNumberOfUnreadMessages extends StatelessWidget {
  const BuildNumberOfUnreadMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: Colors.green,
      child: Text(
        '2',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        maxLines: 1,
      ),
    );
  }
}
