import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/features/groups/data/models/group_chat_model.dart';
import 'package:clone_chat/features/groups/presentation/views/widgets/custom_build_group_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BuildListChatsGroup extends StatelessWidget {
  const BuildListChatsGroup({super.key, required this.groups});
  final List<GroupChatModel> groups;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          GoRouter.of(context)
              .push(AppRouters.kGroupChatView, extra: groups[index]);
        },
        child: CustomBuildGroupItem(
          group: groups[index],
        ),
      ),
    );
  }
}
