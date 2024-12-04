import 'package:clone_chat/core/widgets/custom_chached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class AvatarChat extends StatelessWidget {
  const AvatarChat({super.key, this.redius = 50, required this.imageUrl});
  final double? redius;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InstaImageViewer(
      imageUrl: imageUrl,
      child: CustomChachedNetworkImage(
        imageUrl: imageUrl,
        height: redius?.w,
      ),
    );
  }
}
