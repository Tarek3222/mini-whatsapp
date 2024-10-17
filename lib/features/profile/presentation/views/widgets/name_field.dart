import 'package:clone_chat/core/widgets/default_text.dart';
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  const NameField(
      {super.key, required this.name, required this.nameController});
  final String name;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return defaultText(
      type: TextInputType.text,
      label: name,
      controller: nameController,
    );
  }
}
