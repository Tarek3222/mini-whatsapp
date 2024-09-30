import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle textStyle24 = const TextStyle(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textStyle15 = const TextStyle(
    fontSize: 15,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );
}
