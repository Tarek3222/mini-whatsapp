import 'package:clone_chat/core/constants/strings_constants.dart';
import 'package:clone_chat/features/groups/data/models/group_chat_model.dart';
import 'package:clone_chat/features/groups/presentation/views/widgets/custom_build_group_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BuildLoadingGroups extends StatelessWidget {
  const BuildLoadingGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => CustomBuildGroupItem(
          group: GroupChatModel(
            id: '',
            image: kImageGroupDefault,
            name: 'Family Group',
            description: 'This is a family group',
            lastMessage: 'Hello Tarek, how are you?',
          ),
        ),
      ),
    );
  }
}
