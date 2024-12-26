import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/widgets/custom_loading_indecator.dart';
import 'package:clone_chat/features/groups/data/models/group_chat_model.dart';
import 'package:clone_chat/features/groups/data/models/group_message_model.dart';
import 'package:clone_chat/features/groups/data/services/chat_group_services.dart';
import 'package:clone_chat/features/groups/presentation/views/widgets/group_build_list_bubble_message.dart';
import 'package:flutter/material.dart';

class BuildStreamGroupChat extends StatelessWidget {
  const BuildStreamGroupChat(
      {super.key, required this.group, required this.scrollController});
  final GroupChatModel group;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getIt.get<ChatGroupServices>().getMessages(groupId: group.id!),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return CustomLoadingIndecator();
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              List<GroupMessageModel> messages = snapshot.data?.docs
                      .map(
                        (doc) => GroupMessageModel.fromJson(
                            doc.data() as Map<String, dynamic>),
                      )
                      .toList() ??
                  [];
              if (messages.isNotEmpty) {
                return GroupBuildListBubbleMessage(
                  messages: messages,
                  scrollController: scrollController,
                );
              } else {
                return Center(
                  child: Text(
                    'Start a conversation! 😍',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                );
              }
            } else if (snapshot.hasError) {
              return Text(
                'some thing went wrong',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              );
            } else {
              return Center(
                child: Text(
                  'Start a conversation! 😍',
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
