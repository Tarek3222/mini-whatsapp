// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:clone_chat/core/function/show_snack_bar.dart';
import 'package:clone_chat/core/themes/styles.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/core/widgets/show_awsome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewStatusAppBar extends StatefulWidget implements PreferredSizeWidget {
  const AddNewStatusAppBar(
      {super.key, required this.selectedImage, required this.selectedVideo});
  final File? selectedImage;
  final File? selectedVideo;

  @override
  State<AddNewStatusAppBar> createState() => _AddNewStatusAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}

class _AddNewStatusAppBarState extends State<AddNewStatusAppBar> {
  bool isLoading = false;
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
          onPressed: () async {
            if (widget.selectedImage != null || widget.selectedVideo != null) {
              try {
                setState(() {
                  isLoading = true;
                });
                await getIt.get<UserServices>().addStory(
                    storyType: widget.selectedImage != null ? 'image' : 'video',
                    file: widget.selectedImage != null
                        ? widget.selectedImage!
                        : widget.selectedVideo!);
                setState(() {
                  isLoading = false;
                });
                showSnackBar(context, message: 'Status added successfully');
                Navigator.pop(context);
              } catch (e) {
                showAwsomeDialog(
                  message: e.toString(),
                  context: context,
                  title: 'Error!',
                  dialogType: DialogType.error,
                  btnOkOnPress: () {},
                );
              }
              setState(() {
                isLoading = false;
              });
            } else {
              showAwsomeDialog(
                message: 'Please select image or video',
                context: context,
                title: 'how you want to add status?',
                dialogType: DialogType.info,
                btnOkOnPress: () {},
              );
            }
          },
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.blue,
                )
              : Text(
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
}
