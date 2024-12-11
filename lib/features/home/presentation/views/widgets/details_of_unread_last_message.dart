import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/get_time_formated.dart';
import 'package:clone_chat/features/home/data/models/messege_model.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/build_number_of_unread_message.dart';
import 'package:flutter/material.dart';

class DetailsOfUnreadLastMessage extends StatelessWidget {
  const DetailsOfUnreadLastMessage(
      {super.key, this.messege, required this.chatUser});
  final MessegeModel? messege;
  final ChatUser chatUser;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          messege!.sent != null
              ? getLastMessageTime(context: context, time: messege!.sent!)
              : '',
        ),
        SizedBox(
          height: 5,
        ),
        BuildNumberOfUnreadMessages(
          chatUser: chatUser,
        ),
      ],
    );
  }
}
