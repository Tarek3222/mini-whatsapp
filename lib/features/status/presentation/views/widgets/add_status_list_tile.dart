import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/avatar_add_status.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/title_status.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddStatusListTile extends StatelessWidget {
  const AddStatusListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getIt.get<UserServices>().getCurrentUserStories(),
      builder: (context, snapshot) {
        ChatUser? user;
        List stories = [];
        if (snapshot.hasData) {
          user =
              ChatUser.fromJson(snapshot.data!.data()! as Map<String, dynamic>);
          stories = user.stories ?? [];
          // for delete story after 24 hours
          if (stories.isNotEmpty) {
            for (var story in stories) {
              getIt.get<UserServices>().deleteStoryAfter24Hours(story: story);
            }
          }
        }
        return InkWell(
          onTap: () {
            if (stories.isEmpty) {
              GoRouter.of(context).push(AppRouters.kAddNewStatusView);
            } else {
              GoRouter.of(context)
                  .push(AppRouters.kMyAllStatusView, extra: stories);
            }
          },
          child: ListTile(
            leading: AvatarAddStatus(
              user: user,
              stories: stories,
            ),
            title: TitleStatus(title: 'My Status'),
            subtitle: Text(
              'Tap to add status update',
              style: TextStyle(
                color: Colors.grey.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }
}
