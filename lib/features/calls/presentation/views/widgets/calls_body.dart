import 'package:clone_chat/features/calls/presentation/views/widgets/build_calls_sliver_list.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/updates_state_title.dart';
import 'package:flutter/material.dart';

class CallsBody extends StatelessWidget {
  const CallsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: GreyTitleWithPadding(title: 'Recent calls'),
        ),
        BuildCallsSliverList(),
      ],
    );
  }
}
