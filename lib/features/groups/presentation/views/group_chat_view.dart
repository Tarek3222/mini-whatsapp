import 'package:clone_chat/features/groups/data/models/group_chat_model.dart';
import 'package:clone_chat/features/groups/presentation/views/widgets/group_chat_body.dart';
import 'package:clone_chat/features/groups/presentation/views/widgets/group_chat_view_app_bar.dart';
import 'package:flutter/material.dart';

class GroupChatView extends StatelessWidget {
  const GroupChatView({super.key, required this.group});
  final GroupChatModel group;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GroupChatViewAppBar(
        group: group,
      ),
      body: GroupChatBody(
        group: group,
      ),
    );
  }
}
