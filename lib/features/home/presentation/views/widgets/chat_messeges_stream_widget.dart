import 'package:clone_chat/core/widgets/custom_loading_indecator.dart';
import 'package:clone_chat/features/home/data/models/messege_model.dart';
import 'package:clone_chat/features/home/data/services/messeges_services.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/build_chat_bubble_list_view.dart';
import 'package:flutter/material.dart';

class ChatMessegesStreamWidget extends StatelessWidget {
  const ChatMessegesStreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: MessegesServices().getAllMesseges(),
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
                    messeges: messeges,
                  );
                } else {
                  return const Center(
                    child: Text('Say Hello To Your Friend! 😍'),
                  );
                }
              } else {
                return const Center(
                  child: Text('No Messages Available!'),
                );
              }
            default:
              return const Center(
                child: Text('No Messages Available!'),
              );
          }
        });
  }
}
