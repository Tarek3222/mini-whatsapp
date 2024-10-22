import 'package:flutter/material.dart';

class ChatMessageField extends StatelessWidget {
  const ChatMessageField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade400,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        prefixIcon: const Icon(
          Icons.emoji_emotions_outlined,
          color: Colors.black,
        ),
        suffixIcon: const Icon(
          Icons.attach_file,
          color: Colors.black,
        ),
        hintText: 'Type a message',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
