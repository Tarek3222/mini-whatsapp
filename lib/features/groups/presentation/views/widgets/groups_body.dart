import 'package:clone_chat/features/groups/presentation/views/widgets/build_stream_groups.dart';
import 'package:clone_chat/features/groups/presentation/views/widgets/custom_button_new_group.dart';
import 'package:flutter/material.dart';

class GroupBody extends StatelessWidget {
  const GroupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BuildStreamGroups(),
        Positioned(
          bottom: 20,
          right: 20,
          child: CustomButtonNewGroup(),
        ),
      ],
    );
  }
}
