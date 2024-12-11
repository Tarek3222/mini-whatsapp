import 'package:clone_chat/features/status/presentation/views/widgets/add_status_list_tile.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/build_recent_updates_status_list.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/build_viewed_updates_status_list.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/updates_state_title.dart';
import 'package:flutter/material.dart';

class BuildAllStateOfStatus extends StatelessWidget {
  const BuildAllStateOfStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: AddStatusListTile(),
        ),
        SliverToBoxAdapter(
          child: GreyTitleWithPadding(title: 'Recent updates'),
        ),
        BuildRecentUpdatesStatusList(),
        SliverToBoxAdapter(
          child: GreyTitleWithPadding(title: 'Viewed updates'),
        ),
        BuildViewedUpdatesStatusList(),
      ],
    );
  }
}
