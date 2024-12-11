import 'package:clone_chat/features/status/presentation/views/widgets/add_new_status_app_bar.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/add_new_status_body.dart';
import 'package:flutter/material.dart';

class AddNewStatusView extends StatelessWidget {
  const AddNewStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black54,
      appBar: AddNewStatusAppBar(),
      body: AddNewStatusBody(),
    );
  }
}
