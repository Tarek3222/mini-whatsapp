import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/features/groups/presentation/views/widgets/custom_build_group_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BuildListChatsGroup extends StatelessWidget {
  const BuildListChatsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRouters.kGroupChatView);
        },
        child: const CustomBuildGroupItem(),
      ),
    );
  }
}
