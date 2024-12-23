import 'package:clone_chat/features/groups/presentation/views/widgets/custom_bubble_message.dart';
import 'package:flutter/material.dart';

class GroupBuildListBubbleMessage extends StatelessWidget {
  const GroupBuildListBubbleMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: 10,
      itemBuilder: (context, index) => CustomBubbleMessage(),
    );
  }
}
