import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:status_view/status_view.dart';

class AvatarNewStatus extends StatelessWidget {
  const AvatarNewStatus({super.key, this.user, required this.stories});
  final ChatUser? user;
  final List stories;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (stories.isNotEmpty) {
          GoRouter.of(context).push(AppRouters.kStoriesView, extra: user);
        }
      },
      child: StatusView(
        radius: 32.r,
        spacing: 12.r,
        strokeWidth: 3,
        indexOfSeenStatus: 0,
        numberOfStatus: stories.length,
        padding: 4,
        centerImageUrl:
            user != null ? user!.image! : 'https://i.pravatar.cc/300',
        seenColor: Colors.grey,
        unSeenColor: AppColors.primaryColor,
      ),
    );
  }
}
