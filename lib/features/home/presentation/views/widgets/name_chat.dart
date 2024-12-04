import 'package:flutter/material.dart';

class NameChat extends StatelessWidget {
  const NameChat({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
