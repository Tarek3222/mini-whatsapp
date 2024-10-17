import 'package:clone_chat/features/status/presentation/views/widgets/custom_build_others_status.dart';
import 'package:flutter/material.dart';

class BuildViewedUpdatesStatusList extends StatelessWidget {
  const BuildViewedUpdatesStatusList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return CustomBuildOtherStatus(
          backgroundColor: Colors.grey,
        );
      },
    );
  }
}
