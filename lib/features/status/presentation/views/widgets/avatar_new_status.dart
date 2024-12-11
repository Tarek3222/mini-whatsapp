import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:status_view/status_view.dart';

class AvatarNewStatus extends StatelessWidget {
  const AvatarNewStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouters.kStoriesView);
      },
      child: StatusView(
        radius: 32.r,
        spacing: 12.r,
        strokeWidth: 3,
        indexOfSeenStatus: 0,
        numberOfStatus: 1,
        padding: 4,
        centerImageUrl: "https://picsum.photos/200/300",
        seenColor: Colors.grey,
        unSeenColor: AppColors.primaryColor,
      ),
    );
  }
}
