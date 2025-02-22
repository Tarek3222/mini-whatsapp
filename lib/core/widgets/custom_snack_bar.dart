import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SnackBar customSnackBar(
    {required String text, EdgeInsetsGeometry? margin, Color? color}) {
  return SnackBar(
    content: FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
        ),
      ),
    ),
    margin: margin,
    duration: const Duration(seconds: 3),
    elevation: 0,
    showCloseIcon: true,
    dismissDirection: DismissDirection.horizontal,
    backgroundColor: color ?? Colors.black54,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
