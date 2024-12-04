import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/core/widgets/custom_loading_indecator.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/build_chats_list_view.dart';
import 'package:flutter/material.dart';

class ChatsTabBody extends StatelessWidget {
  const ChatsTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getIt.get<UserServices>().getAllUsers(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CustomLoadingIndecator();

            case ConnectionState.done:
            case ConnectionState.active:
              if (snapshot.hasData) {
                var data = snapshot.data?.docs;
                List<ChatUser> chatsUsers = data
                        ?.map(
                          (doc) => ChatUser.fromJson(
                              doc.data() as Map<String, dynamic>),
                        )
                        .toList() ??
                    [];
                if (chatsUsers.isNotEmpty) {
                  return BuildChatsListView(chatsUsers: chatsUsers);
                } else {
                  return const Center(
                    child: Text('No Chats Available!'),
                  );
                }
              } else {
                return const Center(
                  child: Text('No Chats Available!'),
                );
              }
            default:
              return const Center(
                child: Text('No Chats'),
              );
          }
        });
  }
}
