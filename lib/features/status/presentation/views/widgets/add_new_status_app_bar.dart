import 'package:clone_chat/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewStatusAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AddNewStatusAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        'New Status',
        style: Styles.textStyle24.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Next',
            style: Styles.textStyle15.copyWith(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
              fontSize: 17.sp,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
