import 'package:clone_chat/core/themes/styles.dart';
import 'package:flutter/material.dart';

class LabelField extends StatelessWidget {
  const LabelField({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Styles.textStyle15SemiBold(context).copyWith(
        color: Colors.grey,
      ),
    );
  }
}
