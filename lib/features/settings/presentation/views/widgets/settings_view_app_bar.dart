import 'package:clone_chat/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SettingsViewAppBar({super.key});

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
      title: Text(
        'Settings',
        style: Styles.textStyle24SemiBold(context).copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
