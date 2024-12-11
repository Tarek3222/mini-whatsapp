import 'package:clone_chat/features/status/presentation/views/widgets/avatar_new_status.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/build_icon_add_status.dart';
import 'package:flutter/material.dart';

class AvatarAddStatus extends StatelessWidget {
  const AvatarAddStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AvatarNewStatus(),
        Positioned(
          bottom: 0,
          right: 0,
          child: BuildIconAddStatus(),
        ),
      ],
    );
  }
}
