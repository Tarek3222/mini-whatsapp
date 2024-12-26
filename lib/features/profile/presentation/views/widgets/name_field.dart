import 'package:clone_chat/core/widgets/default_text.dart';
import 'package:clone_chat/features/profile/presentation/views/widgets/field_with_shadow.dart';
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  const NameField({super.key, required this.nameController});
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return FieldWithShadow(
      child: defaultText(
        context: context,
        color: Theme.of(context).colorScheme.onSecondary,
        type: TextInputType.text,
        controller: nameController,
        hint: 'Enter your name',
        validate: (value) {
          if (value!.isEmpty) {
            return 'name must not be empty';
          }
          return null;
        },
      ),
    );
  }
}
