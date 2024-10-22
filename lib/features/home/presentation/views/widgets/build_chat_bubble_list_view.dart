import 'package:clone_chat/features/home/presentation/views/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class BuildChatBubbleListView extends StatelessWidget {
  const BuildChatBubbleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      reverse: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return const ChatBubble();
      },
    );
  }
}
