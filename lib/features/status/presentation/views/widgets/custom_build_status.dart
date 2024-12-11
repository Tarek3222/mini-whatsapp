import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/avatar_status.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/time_status_to_upload.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/title_status.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBuildStatus extends StatelessWidget {
  const CustomBuildStatus({super.key, required this.backgroundColor});
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: InkWell(
        onTap: () => GoRouter.of(context).push(AppRouters.kStoriesView),
        child: CircleAvatar(
          backgroundColor: backgroundColor,
          radius: 30,
          child: AvatarStatus(),
        ),
      ),
      title: TitleStatus(title: 'Tarek Ahmed'),
      subtitle: TimeStatusToUpload(),
    );
  }
}
