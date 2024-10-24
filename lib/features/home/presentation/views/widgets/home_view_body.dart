import 'package:clone_chat/features/home/presentation/views/widgets/build_chats_list_view.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/new_messege_button.dart';
import 'package:flutter/material.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BuildChatsListView(),
        Positioned(
          bottom: 20,
          right: 20,
          child: const NewMessegeButton(),
        )
      ],
    );
  }
}
