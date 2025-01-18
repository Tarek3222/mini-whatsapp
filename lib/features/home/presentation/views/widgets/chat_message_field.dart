import 'package:flutter/material.dart';

class ChatMessageField extends StatelessWidget {
  const ChatMessageField(
      {super.key, required this.messageController, this.onTap});
  final TextEditingController messageController;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: messageController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: 'Type a message',
        hintStyle: TextStyle(letterSpacing: 0.2),
        border: InputBorder.none,
      ),
    );
  }
}
