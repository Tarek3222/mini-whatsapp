import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/avatar_new_status.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/build_icon_add_status.dart';
import 'package:flutter/material.dart';

class AvatarAddStatus extends StatelessWidget {
  const AvatarAddStatus({super.key, this.user, required this.stories});
  final ChatUser? user;
  final List stories;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AvatarNewStatus(
          user: user,
          stories: stories,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: BuildIconAddStatus(),
        ),
      ],
    );
  }
}
