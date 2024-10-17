import 'package:clone_chat/features/status/presentation/views/widgets/build_recent_updates_status_list.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/build_viewed_updates_status_list.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/custom_build_my_status.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/title_updates.dart';
import 'package:flutter/material.dart';

class StatusBody extends StatelessWidget {
  const StatusBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomBuildMyStatus(),
        ),
        SliverToBoxAdapter(
          child: TitleUpdates(title: 'Recent updates'),
        ),
        BuildRecentUpdatesStatusList(),
        SliverToBoxAdapter(
          child: TitleUpdates(title: 'Viewed updates'),
        ),
        BuildViewedUpdatesStatusList(),
      ],
    );
  }
}
