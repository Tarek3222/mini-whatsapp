// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:clone_chat/core/constants/strings_constants.dart';
import 'package:clone_chat/core/function/show_snack_bar.dart';
import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:clone_chat/core/themes/styles.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/widgets/custom_chached_network_image.dart';
import 'package:clone_chat/core/widgets/custom_loading_indecator.dart';
import 'package:clone_chat/features/groups/data/services/groups_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class BuildBottomSheetNewGroup extends StatefulWidget {
  const BuildBottomSheetNewGroup({super.key});

  @override
  State<BuildBottomSheetNewGroup> createState() =>
      _BuildBottomSheetNewGroupState();
}

class _BuildBottomSheetNewGroupState extends State<BuildBottomSheetNewGroup> {
  final formKey = GlobalKey<FormState>();
  TextEditingController groupNameController = TextEditingController();
  TextEditingController groupDescriptionController = TextEditingController();
  File? file;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      height: 300.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'New Group',
                  style: Styles.textStyle24SemiBold(context),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Stack(
                    children: [
                      file != null
                          ? CircleAvatar(
                              backgroundImage: FileImage(file!),
                              radius: 35.r,
                            )
                          : CustomChachedNetworkImage(
                              imageUrl: kImageGroupDefault,
                              height: 50.h,
                            ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () async {
                            ImagePicker picker = ImagePicker();
                            XFile? image = await picker.pickImage(
                              source: ImageSource.gallery,
                            );
                            if (image != null) {
                              setState(
                                () {
                                  file = File(image.path);
                                },
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: TextFormField(
                      controller: groupNameController,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Group Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        hintText: 'Group Name',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              TextFormField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                controller: groupDescriptionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Group Description';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  hintText: 'Group Description',
                ),
              ),
              const SizedBox(height: 20),
              isLoading
                  ? CustomLoadingIndecator()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        minimumSize: Size(250.w, 50),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            setState(() {
                              isLoading = true;
                            });
                            await getIt.get<GroupsServices>().createGroup(
                                  nameGroup: groupNameController.text.trim(),
                                  descGroup:
                                      groupDescriptionController.text.trim(),
                                  file: file,
                                );
                            Navigator.pop(context);
                            showSnackBar(context,
                                message: 'Group Created Successfully');
                          } catch (e) {
                            showSnackBar(context,
                                message: 'Failed to create group, try again');
                          }
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      child:
                          Text('Create', style: Styles.font18SemiBold(context)),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
