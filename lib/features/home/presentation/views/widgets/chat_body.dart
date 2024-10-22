import 'package:clone_chat/features/home/presentation/views/widgets/build_chat_bubble_list_view.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/chat_message_field.dart';
import 'package:flutter/material.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          child: BuildChatBubbleListView(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3),
          child: ChatMessageField(),
        ),
      ],
    );
  }
}
