import 'package:clone_chat/core/widgets/default_text.dart';
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  const NameField({super.key, required this.nameController});
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return defaultText(
      context: context,
      type: TextInputType.name,
      label: 'Name',
      hint: 'Enter your name',
      controller: nameController,
      validate: (value) {
        if (value!.isEmpty) {
          return 'name must not be empty';
        }
        return null;
      },
      prefixIcon: Icons.person,
    );
  }
}
