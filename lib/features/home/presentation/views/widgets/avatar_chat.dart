import 'package:flutter/material.dart';

class AvatarChat extends StatelessWidget {
  const AvatarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey.shade500,
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: 26,
      ),
    );
  }
}
