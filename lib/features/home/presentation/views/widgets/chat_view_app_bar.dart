import 'package:clone_chat/features/home/presentation/views/widgets/avatar_chat.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/name_chat.dart';
import 'package:flutter/material.dart';

class ChatViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 3),
          AvatarChat(
            redius: 22,
          ),
          const SizedBox(width: 10),
          const NameChat(),
        ],
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.5,
          color: Colors.grey,
        ),
      ),
      actions: [
        const Icon(Icons.call),
        const SizedBox(width: 5),
        const Icon(Icons.more_vert),
        const SizedBox(width: 5),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
