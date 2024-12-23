import 'package:clone_chat/core/themes/styles.dart';
import 'package:clone_chat/core/widgets/custom_chached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupChatViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const GroupChatViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.5,
          color: Colors.grey,
        ),
      ),
      title: Row(
        children: [
          CustomChachedNetworkImage(
            imageUrl: 'https://cdn-icons-png.flaticon.com/512/681/681494.png',
            height: 30.h,
          ),
          SizedBox(width: 10.w),
          Text(
            'Family Group',
            style: Styles.font22Bold(context),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
