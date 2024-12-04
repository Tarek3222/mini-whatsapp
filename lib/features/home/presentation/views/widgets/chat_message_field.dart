import 'package:flutter/material.dart';

class ChatMessageField extends StatelessWidget {
  const ChatMessageField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        hintText: 'Type a message',
        border: InputBorder.none,
      ),
    );
  }
}
