import 'package:clone_chat/core/constants/strings_constants.dart';
import 'package:clone_chat/core/widgets/custom_chached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBuildGroupItem extends StatelessWidget {
  const CustomBuildGroupItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomChachedNetworkImage(
        imageUrl: kImageGroupDefault,
        height: 40.h,
      ),
      title: Text(
        'Family Group',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'This is a family group',
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
      ),
    );
  }
}
