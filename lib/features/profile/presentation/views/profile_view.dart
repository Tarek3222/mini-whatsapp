import 'package:clone_chat/features/profile/presentation/views/widgets/profile_body.dart';
import 'package:clone_chat/features/profile/presentation/views/widgets/profile_view_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          FocusManager.instance.primaryFocus?.unfocus(), //hide keyboard
      child: const Scaffold(
        appBar: ProfileViewAppBar(),
        body: ProfileBody(),
      ),
    );
  }
}
