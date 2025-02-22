import 'package:clone_chat/features/status/presentation/views/widgets/my_all_status_body.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/my_all_status_view_app_bar.dart';
import 'package:flutter/material.dart';

class MyAllStatusView extends StatelessWidget {
  const MyAllStatusView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAllStatusViewAppBar(),
      body: MyAllStatusBody(),
    );
  }
}
