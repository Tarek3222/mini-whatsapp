import 'package:clone_chat/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SaveProfileButton extends StatelessWidget {
  const SaveProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomButton(
        borderRadius: BorderRadius.circular(25),
        text: 'Save Profile',
        height: 60,
        textColor: Colors.white,
        fontSize: 18,
        onPressed: () {},
      ),
    );
  }
}
