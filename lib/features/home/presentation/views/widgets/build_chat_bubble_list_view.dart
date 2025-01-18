import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:clone_chat/features/home/data/models/messege_model.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/chat_bubble.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/show_custom_model_bottom_sheet.dart';
import 'package:flutter/material.dart';

class BuildChatBubbleListView extends StatelessWidget {
  const BuildChatBubbleListView(
      {super.key,
      required this.messeges,
      required this.scrollController,
      required this.user});
  final List<MessegeModel> messeges;
  final ChatUser user;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messeges.length,
      controller: scrollController,
      reverse: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        bool isMe =
            AuthServices().auth.currentUser!.uid == messeges[index].fromId;
        return InkWell(
          onLongPress: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ShowCustomModelBottomSheet(
                  message: messeges[index],
                  user: user,
                  isMe: isMe,
                );
              },
            );
          },
          child: isMe
              ? ChatBubbleFromMe(
                  messege: messeges[index],
                )
              : ChatBubbleFromFriend(
                  messege: messeges[index],
                ),
        );
      },
    );
  }
}
