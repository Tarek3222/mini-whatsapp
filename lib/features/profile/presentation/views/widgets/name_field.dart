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
        type: TextInputType.text,
        label: 'name',
        controller: nameController,
      ),
    );
  }
}
