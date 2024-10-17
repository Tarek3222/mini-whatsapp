import 'package:clone_chat/core/widgets/default_text.dart';
import 'package:clone_chat/features/profile/presentation/views/widgets/field_with_shadow.dart';
import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  const PhoneField(
      {super.key, required this.phone, required this.phoneController});
  final String phone;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return FieldWithShadow(
      child: defaultText(
        type: TextInputType.phone,
        label: phone,
        controller: phoneController,
      ),
    );
  }
}