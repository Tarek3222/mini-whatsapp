import 'package:clone_chat/core/constants/assets_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarStatus extends StatelessWidget {
  const AvatarStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 27.r,
      backgroundImage: AssetImage(
        AssetsImages.profileImage,
      ),
    );
  }
}
