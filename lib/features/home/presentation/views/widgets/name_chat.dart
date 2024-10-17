import 'package:flutter/material.dart';

class NameChat extends StatelessWidget {
  const NameChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'John Doe',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
