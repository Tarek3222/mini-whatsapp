import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/core/widgets/custom_loading_indecator.dart';
import 'package:clone_chat/features/profile/presentation/views/widgets/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileStreamBuild extends StatefulWidget {
  const ProfileStreamBuild({super.key});

  @override
  State<ProfileStreamBuild> createState() => _ProfileStreamBuildState();
}

class _ProfileStreamBuildState extends State<ProfileStreamBuild> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    aboutMeController.dispose();
  }

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
        return ProfileBody(
          userModel: userModel,
          nameController: nameController,
          phoneController: phoneController,
          aboutMeController: aboutMeController,
        );
      },
    );
  }
}
