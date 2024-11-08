import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Styles {
  static TextStyle textStyle24 = TextStyle(
    fontSize: 24.sp,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textStyle15 = TextStyle(
    fontSize: 15.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );
}
