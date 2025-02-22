import 'package:clone_chat/core/widgets/default_text.dart';
import 'package:clone_chat/features/profile/presentation/views/widgets/field_with_shadow.dart';
import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key, required this.phoneController});
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return FieldWithShadow(
      child: defaultText(
          context: context,
          type: TextInputType.phone,
          color: Theme.of(context).colorScheme.onSecondary,
          controller: phoneController,
          hint: 'Enter your phone number',
          validate: (value) {
            if (value!.isEmpty) {
              return 'phone must not be empty';
            }
            return null;
          }),
    );
  }
}
