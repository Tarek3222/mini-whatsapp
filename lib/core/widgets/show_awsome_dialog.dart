import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

showAwsomeDialog(
    {required String message,
    required BuildContext context,
    required String title,
    void Function()? btnOkOnPress,
    void Function()? btnCancelOnPress,
    DialogType dialogType = DialogType.info}) {
  return AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    title: title,
    desc: message,
    btnOkOnPress: btnOkOnPress,
    btnCancelOnPress: btnCancelOnPress,
  )..show();
}
