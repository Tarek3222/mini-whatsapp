import 'package:flutter/material.dart';

class BuildViewedUpdatesStatusList extends StatelessWidget {
  const BuildViewedUpdatesStatusList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Text('');
        // return CustomBuildStatus(
        //   backgroundColor: Colors.grey,
        // );
      },
    );
  }
}
