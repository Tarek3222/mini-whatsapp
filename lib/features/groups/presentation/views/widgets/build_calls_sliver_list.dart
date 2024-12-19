import 'package:clone_chat/features/groups/presentation/views/widgets/call_list_tile.dart';
import 'package:flutter/material.dart';

class BuildCallsSliverList extends StatelessWidget {
  const BuildCallsSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CallListTile();
      },
    );
  }
}
