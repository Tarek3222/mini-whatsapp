import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/widgets/custom_loading_indecator.dart';
import 'package:clone_chat/features/home/data/models/messege_model.dart';
import 'package:clone_chat/features/home/data/services/messeges_services.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/build_chat_bubble_list_view.dart';
import 'package:flutter/material.dart';

class ChatMessegesStreamWidget extends StatelessWidget {
  const ChatMessegesStreamWidget(
      {super.key, required this.chatUser, required this.scrollController});
  final ChatUser chatUser;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: MessegesServices().getAllMesseges(chatUser),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return CustomLoadingIndecator();

          case ConnectionState.done:
          case ConnectionState.active:
            if (snapshot.hasData) {
              var data = snapshot.data?.docs;
              List<MessegeModel> messeges = data
                      ?.map(
                        (doc) => MessegeModel.fromJson(
                            doc.data() as Map<String, dynamic>),
                      )
                      .toList() ??
                  [];
              if (messeges.isNotEmpty) {
                return BuildChatBubbleListView(
                  user: chatUser,
                  messeges: messeges,
                  scrollController: scrollController,
                );
              } else {
                return Center(
                  child: Text(
                    'Say Hello To Your Friend! 😍',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                );
              }
            } else {
              return Center(
                child: Text(
                  'No Messages Available!',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              );
            }
        }
      },
    );
  }
}
