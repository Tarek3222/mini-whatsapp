import 'package:clone_chat/features/status/presentation/views/widgets/my_all_status_body.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/my_all_status_view_app_bar.dart';
import 'package:flutter/material.dart';

class MyAllStatusView extends StatelessWidget {
  const MyAllStatusView({super.key, required this.stories});
  final List stories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAllStatusViewAppBar(),
      body: MyAllStatusBody(stories: stories),
    );
  }
}
