import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:clone_chat/features/groups/data/models/group_message_model.dart';
import 'package:clone_chat/features/groups/presentation/views/widgets/custom_bubble_message.dart';
import 'package:flutter/material.dart';

class GroupBuildListBubbleMessage extends StatelessWidget {
  const GroupBuildListBubbleMessage(
      {super.key, required this.scrollController, required this.messages});
  final ScrollController scrollController;
  final List<GroupMessageModel> messages;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      controller: scrollController,
      itemBuilder: (context, index) {
        if (messages[index].fromId == AuthServices().auth.currentUser!.uid) {
          return CustomBubbleMessage(
            message: messages[index],
          );
        } else {
          return CustomBubbleMessagefriend(
            message: messages[index],
          );
        }
      },
    );
  }
}
