import 'package:clone_chat/core/constants/assets_images.dart';
import 'package:flutter/material.dart';

class AvatarStatus extends StatelessWidget {
  const AvatarStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 26,
      backgroundImage: AssetImage(
        AssetsImages.profileImage,
      ),
    );
  }
}
