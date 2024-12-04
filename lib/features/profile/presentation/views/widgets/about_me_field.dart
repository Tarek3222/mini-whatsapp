import 'package:clone_chat/core/widgets/default_text.dart';
import 'package:clone_chat/features/profile/presentation/views/widgets/field_with_shadow.dart';
import 'package:flutter/material.dart';

class AboutMeField extends StatelessWidget {
  const AboutMeField({super.key, required this.aboutMeController});
  final TextEditingController aboutMeController;

  @override
  Widget build(BuildContext context) {
    return FieldWithShadow(
      child: defaultText(
        type: TextInputType.text,
        controller: aboutMeController,
        hint: 'Enter your about me',
        validate: (value) {
          if (value!.isEmpty) {
            return 'about me must not be empty';
          }
          return null;
        },
      ),
    );
  }
}
