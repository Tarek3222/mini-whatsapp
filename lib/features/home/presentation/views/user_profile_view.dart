import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/user_profile_body.dart';
import 'package:flutter/material.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key, required this.user});
  final ChatUser user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: UserProfileBody(
          user: user,
        ),
      ),
    );
  }
}
