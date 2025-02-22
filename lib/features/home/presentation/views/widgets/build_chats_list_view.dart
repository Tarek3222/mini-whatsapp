import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/custom_build_chat.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BuildChatsListView extends StatelessWidget {
  const BuildChatsListView({super.key, required this.chatsUsers});
  final List<ChatUser> chatsUsers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatsUsers.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            GoRouter.of(context).push(
              AppRouters.kChatView,
              extra: chatsUsers[index],
            );
          },
          child: CustomBuildChat(
            chatUser: chatsUsers[index],
          ),
        );
      },
    );
  }
}
