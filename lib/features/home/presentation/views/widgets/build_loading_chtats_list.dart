import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/avatar_chat.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/name_chat.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BuildLoadingChtatsList extends StatelessWidget {
  const BuildLoadingChtatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return CustomLoadingItem(
            chatUser: ChatUser(
              about: 'hello world',
              email: '00tarek@.com',
              name: 'Tarek ahemd',
              lastMessage: 'Hello Tarek, how are you?',
              lastMessageTime: '22/2/2022',
            ),
          );
        },
      ),
    );
  }
}

class CustomLoadingItem extends StatelessWidget {
  const CustomLoadingItem({super.key, required this.chatUser});
  final ChatUser chatUser;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AvatarChat(
        user: chatUser,
      ),
      title: NameChat(
        name: chatUser.name ?? 'unknown user',
      ),
      subtitle: Text(
        chatUser.about ?? '',
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.grey),
        maxLines: 1,
      ),
      trailing: Text(
        '20/2/2022',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
