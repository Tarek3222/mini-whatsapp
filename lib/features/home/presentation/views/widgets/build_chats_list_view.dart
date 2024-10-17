import 'package:clone_chat/features/home/presentation/views/widgets/custom_build_chat.dart';
import 'package:flutter/material.dart';

class BuildChatsListView extends StatelessWidget {
  const BuildChatsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return CustomBuildChat();
      },
    );
  }
}
