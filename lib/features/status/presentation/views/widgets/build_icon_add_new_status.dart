import 'package:flutter/material.dart';

class BuildIconAddNewStatus extends StatelessWidget {
  const BuildIconAddNewStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.green,
      radius: 10,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 8,
        child: const Icon(
          Icons.add,
          color: Colors.green,
          size: 15,
        ),
      ),
    );
  }
}
