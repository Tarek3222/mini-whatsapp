import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/features/home/data/models/messege_model.dart';
import 'package:clone_chat/features/home/data/services/messeges_services.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/avatar_chat.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/details_of_unread_last_message.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/name_chat.dart';
import 'package:flutter/material.dart';

class CustomBuildChat extends StatelessWidget {
  const CustomBuildChat({super.key, required this.chatUser});
  final ChatUser chatUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: MessegesServices().getLastMessege(chatUser),
      builder: (context, snapshot) {
        var data = snapshot.data?.docs;
        List<MessegeModel> messeges = [];
        if (data != null) {
          messeges = data
              .map((doc) =>
                  MessegeModel.fromJson(doc.data() as Map<String, dynamic>))
              .toList();
        }
        return ListTile(
          leading: AvatarChat(
            user: chatUser,
          ),
          title: NameChat(
            name: chatUser.name ?? 'unknown user',
          ),
          subtitle: Text(
            messeges.isNotEmpty
                ? messeges[0].type == Type.image
                    ? 'image'
                    : messeges[0].message!
                : chatUser.about ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          trailing: DetailsOfUnreadLastMessage(
            messege: messeges.isNotEmpty ? messeges[0] : MessegeModel(),
            chatUser: chatUser,
          ),
        );
      },
    );
  }
}
