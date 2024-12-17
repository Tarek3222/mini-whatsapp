import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle textStyle24SemiBold(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        color: Colors.black,
        fontWeight: FontWeight.w600,
      );
  static TextStyle textStyle15SemiBold(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 15),
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w600,
      );

  static TextStyle font18SemiBold(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        color: Colors.black,
        fontWeight: FontWeight.w600);
  }

  static TextStyle font14Medium(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        color: Colors.black,
        fontWeight: FontWeight.w500);
  }

  static TextStyle font14Bold(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        color: Colors.black,
        fontWeight: FontWeight.bold);
  }

  static TextStyle font18Medium(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        color: Colors.black,
        fontWeight: FontWeight.w500);
  }

  static TextStyle font22Bold(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 22),
        color: Colors.black,
        fontWeight: FontWeight.bold);
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 800) {
    return width / 550;
  } else if (width < 1200) {
    return width / 1000;
  } else {
    return width / 2300;
  }
}
