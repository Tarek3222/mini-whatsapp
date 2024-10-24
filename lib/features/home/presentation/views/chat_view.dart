import 'package:clone_chat/features/home/presentation/views/widgets/chat_body.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/chat_view_app_bar.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatViewAppBar(),
      body: ChatBody(),
    );
  }
}
