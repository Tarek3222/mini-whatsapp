import 'package:flutter/material.dart';

class CustomInputFieldMessage extends StatelessWidget {
  const CustomInputFieldMessage(
      {super.key, required this.controller, this.onChanged});
  final TextEditingController controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      onChanged: onChanged,
      keyboardType: TextInputType.multiline,
      controller: controller,
      maxLines: null,
      decoration: InputDecoration(
        hintText: 'Send a message',
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
      ),
    );
  }
}
