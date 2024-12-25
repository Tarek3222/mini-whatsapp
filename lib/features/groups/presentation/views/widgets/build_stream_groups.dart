import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/features/groups/data/models/group_chat_model.dart';
import 'package:clone_chat/features/groups/data/services/groups_services.dart';
import 'package:clone_chat/features/groups/presentation/views/widgets/build_list_chats_group.dart';
import 'package:clone_chat/features/groups/presentation/views/widgets/build_loading_groups.dart';
import 'package:flutter/material.dart';

class BuildStreamGroups extends StatelessWidget {
  const BuildStreamGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getIt.get<GroupsServices>().getAllGroups(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return BuildLoadingGroups();
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              List<GroupChatModel> groups = snapshot.data?.docs
                      .map(
                        (doc) => GroupChatModel.fromJson(
                            doc.data() as Map<String, dynamic>),
                      )
                      .toList() ??
                  [];
              if (groups.isNotEmpty) {
                return BuildListChatsGroup(
                  groups: groups,
                );
              } else {
                return Center(
                  child: Text('No groups yet, create one!'),
                );
              }
            } else if (snapshot.hasError) {
              return Text('some thing went wrong');
            } else {
              return Center(
                child: Text('No groups yet, create one!'),
              );
            }
        }
      },
    );
  }
}
