import 'package:clone_chat/features/groups/presentation/views/widgets/group_chat_body.dart';
import 'package:clone_chat/features/groups/presentation/views/widgets/group_chat_view_app_bar.dart';
import 'package:flutter/material.dart';

class GroupChatView extends StatelessWidget {
  const GroupChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GroupChatViewAppBar(),
      body: GroupChatBody(),
    );
  }
}
