import 'package:clone_chat/features/status/presentation/views/widgets/build_all_state_fo_status.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/new_status_button.dart';
import 'package:flutter/material.dart';

class StatusBody extends StatelessWidget {
  const StatusBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BuildAllStateFoStatus(),
        Positioned(
          bottom: 20,
          right: 20,
          child: NewStatusButton(),
        ),
      ],
    );
  }
}
