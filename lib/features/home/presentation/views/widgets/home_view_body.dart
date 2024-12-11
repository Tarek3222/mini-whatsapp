import 'package:clone_chat/features/home/presentation/views/widgets/chats_tab_body.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/new_messege_button.dart';
import 'package:flutter/material.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ChatsTabBody(),
        AnimatedPositioned(
          duration: const Duration(seconds: 1),
          bottom: 20,
          right: 20,
          child: const NewMessegeButton(),
        )
      ],
    );
  }
}
