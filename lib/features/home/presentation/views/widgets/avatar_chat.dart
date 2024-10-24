import 'package:flutter/material.dart';

class AvatarChat extends StatelessWidget {
  const AvatarChat({super.key, this.redius = 30});
  final double? redius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: redius,
      backgroundColor: Colors.grey.shade500,
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: 26,
      ),
    );
  }
}
