import 'package:clone_chat/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SavedButton extends StatelessWidget {
  const SavedButton({super.key, required this.onSuccess});
  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      borderRadius: BorderRadius.circular(22),
      text: 'Save',
      onPressed: onSuccess,
    );
  }
}
