import 'package:clone_chat/features/home/presentation/views/widgets/avatar_chat.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/details_of_unread_last_message.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/name_chat.dart';
import 'package:flutter/material.dart';

class CustomBuildChat extends StatelessWidget {
  const CustomBuildChat({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AvatarChat(),
      title: NameChat(),
      subtitle: Text('# 01271845331'),
      trailing: DetailsOfUnreadLastMessage(),
    );
  }
}
