import 'package:clone_chat/features/status/presentation/views/widgets/avatar_status.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/build_icon_add_new_status.dart';
import 'package:flutter/material.dart';

class AvatarAddNewStatus extends StatelessWidget {
  const AvatarAddNewStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AvatarStatus(),
        Positioned(
          bottom: 0,
          right: 0,
          child: BuildIconAddNewStatus(),
        ),
      ],
    );
  }
}
