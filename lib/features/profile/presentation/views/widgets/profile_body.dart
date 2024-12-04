// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:clone_chat/core/function/show_snack_bar.dart';
import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:clone_chat/core/themes/styles.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/core/widgets/custom_loading_indecator.dart';
import 'package:clone_chat/core/widgets/show_awsome_dialog.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:clone_chat/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:clone_chat/features/profile/presentation/views/widgets/profile_information.dart';
import 'package:clone_chat/features/profile/presentation/views/widgets/save_profile_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  var key = GlobalKey<FormState>();
  String? selectedImage;
  bool isUploading = false;
  bool isLoading = false;

  File? file;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getIt.get<UserServices>().getCurrentUser(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CustomLoadingIndecator();
          }
          var userModel =
              ChatUser.fromJson(snapshot.data!.data()! as Map<String, dynamic>);
          nameController.text = userModel.name.toString();
          phoneController.text = userModel.phone.toString();
          aboutMeController.text = userModel.about.toString();
          return SingleChildScrollView(
            child: Form(
              key: key,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  ProfileImage(
                    imageProfile: selectedImage ?? userModel.image.toString(),
                    imageFile: file,
                    onTap: () {
                      try {
                        setState(() {
                          isUploading = true;
                        });
                        showCustomBottomSheet(context);
                      } catch (e) {
                        showSnackBar(context,
                            message: 'something went wrong, try again');
                      }
                      setState(() {
                        isUploading = false;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (isUploading) const CustomLoadingIndecator(),
                  Text(
                    userModel.email.toString(),
                  ),
                  const Divider(
                    height: 50,
                  ),
                  ProfileInformation(
                    nameController: nameController,
                    phoneController: phoneController,
                    aboutMeController: aboutMeController,
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  SaveProfileButton(
                    isLoading: isLoading,
                    onPressed: () async {
                      if (key.currentState!.validate()) {
                        try {
                          setState(() {
                            isLoading = true;
                          });
                          if (file != null) {
                            if (userModel.image != null &&
                                userModel.image != '') {
                              await FirebaseStorage.instance
                                  .refFromURL(userModel.image!)
                                  .delete();
                            }
                            String fileName = basename(file!.path);
                            var refStorage = FirebaseStorage.instance.ref(
                                'userImages/$fileName'); // create ref for storage and the name is all_images (folrder)
                            await refStorage.putFile(file!);
                            selectedImage = await refStorage.getDownloadURL();
                          }
                          ChatUser user = ChatUser(
                            name: nameController.text,
                            phone: phoneController.text,
                            image: selectedImage ?? userModel.image.toString(),
                            email: userModel.email,
                            uid: userModel.uid,
                            about: aboutMeController.text,
                          );
                          await UserServices().updateUser(user: user);
                          getIt
                              .get<AuthServices>()
                              .auth
                              .currentUser!
                              .updateDisplayName(nameController.text);
                          getIt
                              .get<AuthServices>()
                              .auth
                              .currentUser!
                              .updatePhotoURL(user.image.toString());
                          showSnackBar(context, message: 'Profile updated');
                          Navigator.pop(context);
                        } catch (e) {
                          showAwsomeDialog(
                            message: 'something went wrong, try again $e',
                            context: context,
                            title: 'Error',
                            dialogType: DialogType.error,
                            btnOkOnPress: () {},
                          );
                        }
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  showCustomBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pick Profile image',
                  style: Styles.textStyle24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? imageGellery = await picker.pickImage(
                            source: ImageSource.gallery, imageQuality: 80);
                        if (imageGellery != null) {
                          setState(() {
                            file = File(imageGellery.path);
                            Navigator.pop(context);
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.image,
                        color: AppColors.primaryColor,
                        size: 50,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? imageCamera = await picker.pickImage(
                            source: ImageSource.camera, imageQuality: 80);
                        if (imageCamera != null) {
                          setState(() {
                            file = File(imageCamera.path);
                            Navigator.pop(context);
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.primaryColor,
                        size: 50,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: AppColors.primaryColor),
                        )))
              ],
            ),
          );
        });
  }
}
