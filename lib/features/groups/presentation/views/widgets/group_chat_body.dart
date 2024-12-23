import 'package:clone_chat/features/groups/presentation/views/widgets/custom_input_field_message.dart';
import 'package:clone_chat/features/groups/presentation/views/widgets/group_build_list_bubble_message.dart';
import 'package:flutter/material.dart';

class GroupChatBody extends StatefulWidget {
  const GroupChatBody({super.key});

  @override
  State<GroupChatBody> createState() => _GroupChatBodyState();
}

class _GroupChatBodyState extends State<GroupChatBody> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SafeArea(
          child: SizedBox(),
        ),
        Expanded(
          child: GroupBuildListBubbleMessage(),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 30,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomInputFieldMessage(controller: controller),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.image,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
