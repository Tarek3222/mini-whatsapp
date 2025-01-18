import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:clone_chat/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatAiViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAiViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(
        color: AppColors.primaryColor,
      ),
      centerTitle: true,
      title: Text(
        'Chat With Gemini',
        style:
            Styles.font22Bold(context).copyWith(color: AppColors.primaryColor),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
