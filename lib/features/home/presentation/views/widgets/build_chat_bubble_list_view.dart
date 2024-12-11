import 'package:clone_chat/features/home/data/models/messege_model.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class BuildChatBubbleListView extends StatelessWidget {
  const BuildChatBubbleListView({super.key, required this.messeges});
  final List<MessegeModel> messeges;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messeges.length,
      reverse: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ChatBubbleFromMe(
          messege: messeges[index],
        );
      },
    );
  }
}
