import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/avatar_status.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/time_status_to_upload.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/title_status.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBuildStatus extends StatelessWidget {
  const CustomBuildStatus(
      {super.key, required this.user, required this.stories});
  final ChatUser user;
  final List stories;

  @override
  Widget build(BuildContext context) {
    if (stories.isNotEmpty) {
      for (var story in stories) {
        getIt.get<UserServices>().deleteStoryAfter24Hours(story: story);
      }
    }
    return ListTile(
      leading: InkWell(
        onTap: () =>
            GoRouter.of(context).push(AppRouters.kStoriesView, extra: user),
        child: AvatarStatus(
          stories: stories,
          user: user,
        ),
      ),
      title: TitleStatus(title: user.name ?? 'Unknown user'),
      subtitle: TimeStatusToUpload(
        stories: stories,
      ),
    );
  }
}
