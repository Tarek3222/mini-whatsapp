// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:clone_chat/core/constants/strings_constants.dart';
import 'package:clone_chat/core/function/show_snack_bar.dart';
import 'package:clone_chat/core/models/user_model.dart';
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
  String? selectedImage;
  bool isUploading = false;
  bool isLoading = false;

  File? file;
  @override
  Widget build(BuildContext context) {
    String email = AuthServices().auth.currentUser!.email.toString();
    return StreamBuilder(
        stream: UserServices().getAllUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CustomLoadingIndecator();
          }
          List<UserModel> users = [];
          for (var doc in snapshot.data!.docs) {
            if (doc.get(kEmailUser) == email) {
              users.add(
                UserModel(
                  name: doc.get(kNameUser),
                  email: doc.get(kEmailUser),
                  phone: doc.get(kPhoneUser),
                  uid: doc.id,
                  image: doc.get(kImageUser),
                ),
              );
            }
          }
          var all = users.where((element) => element.email == email).toList();
          var userModel = all[0];
          nameController.text = userModel.name.toString();
          phoneController.text = userModel.phone.toString();
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                ProfileImage(
                  imageProfile: selectedImage ?? userModel.image.toString(),
                  onTap: () async {
                    try {
                      final ImagePicker picker = ImagePicker();
                      setState(() {
                        isUploading = true;
                      });
                      final XFile? imageGellery =
                          await picker.pickImage(source: ImageSource.gallery);

                      if (imageGellery != null) {
                        setState(() {
                          file = File(imageGellery.path);
                        });
                        String fileName = basename(imageGellery.path);
                        var refStorage = FirebaseStorage.instance.ref(
                            'userImages/$fileName'); // create ref for storage and the name is all_images (folrder)
                        await refStorage.putFile(file!);
                        selectedImage = await refStorage.getDownloadURL();
                        showSnackBar(context, message: 'Image uploaded');
                      }
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
                const Divider(
                  height: 70,
                ),
                ProfileInformation(
                  nameController: nameController,
                  phoneController: phoneController,
                ),
                const SizedBox(
                  height: 45,
                ),
                SaveProfileButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    UserModel user = UserModel(
                      name: nameController.text,
                      phone: phoneController.text,
                      image: selectedImage ?? userModel.image.toString(),
                      email: userModel.email,
                      uid: userModel.uid,
                    );
                    try {
                      await UserServices().updateUser(user: user);
                      showSnackBar(context, message: 'Profile updated');
                      Navigator.pop(context);
                    } catch (e) {
                      showAwsomeDialog(
                        message: 'something went wrong, try again',
                        context: context,
                        title: 'Error',
                        dialogType: DialogType.error,
                      );
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
              ],
            ),
          );
        });
  }
}
