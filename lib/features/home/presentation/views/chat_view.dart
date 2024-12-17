import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/chat_body.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/chat_view_app_bar.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.chatUser});
  final ChatUser chatUser;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: ChatViewAppBar(
          chatUser: chatUser,
        ),
        body: ChatBody(
          chatUser: chatUser,
        ),
      ),
    );
  }
}
