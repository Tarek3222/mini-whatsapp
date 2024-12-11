import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/avatar_chat.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/details_of_unread_last_message.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/name_chat.dart';
import 'package:flutter/material.dart';

class CustomBuildChat extends StatelessWidget {
  const CustomBuildChat({super.key, required this.chatUser});
  final ChatUser chatUser;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AvatarChat(
        imageUrl: chatUser.image ?? '',
      ),
      title: NameChat(
        name: chatUser.name ?? 'unknown user',
      ),
      subtitle: Text(
        chatUser.about ?? '',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: DetailsOfUnreadLastMessage(),
    );
  }
}
