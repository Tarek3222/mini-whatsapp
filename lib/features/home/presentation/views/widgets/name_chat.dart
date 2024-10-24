import 'package:flutter/material.dart';

class NameChat extends StatelessWidget {
  const NameChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Tarek Ahmed',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
