import 'package:clone_chat/features/status/presentation/views/widgets/custom_build_status.dart';
import 'package:flutter/material.dart';

class BuildRecentUpdatesStatusList extends StatelessWidget {
  const BuildRecentUpdatesStatusList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return CustomBuildStatus(
          backgroundColor: Colors.green,
        );
      },
    );
  }
}
