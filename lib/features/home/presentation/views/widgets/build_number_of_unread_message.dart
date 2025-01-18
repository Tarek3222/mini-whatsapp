import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/features/home/data/services/messeges_services.dart';
import 'package:flutter/material.dart';

class BuildNumberOfUnreadMessages extends StatelessWidget {
  const BuildNumberOfUnreadMessages({super.key, required this.chatUser});
  final ChatUser chatUser;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: MessegesServices().getUnreadMesseges(chatUser),
      builder: (context, snapshot) {
        var data = snapshot.data?.docs;
        int length = 0;
        if (data != null) {
          length = data.length;
        }
        return length == 0
            ? const SizedBox()
            : CircleAvatar(
                radius: 12,
                backgroundColor: Colors.green,
                child: Text(
                  length.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                ),
              );
      },
    );
  }
}
