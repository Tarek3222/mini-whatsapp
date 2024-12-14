import 'package:clone_chat/features/status/presentation/views/widgets/build_all_my_status.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/new_status_button.dart';
import 'package:flutter/material.dart';

class MyAllStatusBody extends StatelessWidget {
  const MyAllStatusBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BuildAllMyStatus(),
        Positioned(
          bottom: 20,
          right: 20,
          child: NewStatusButton(),
        ),
      ],
    );
  }
}
