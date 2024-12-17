import 'package:clone_chat/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAllStatusViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MyAllStatusViewAppBar({super.key});

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
      title: Text('My Status', style: Styles.textStyle24SemiBold(context)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
