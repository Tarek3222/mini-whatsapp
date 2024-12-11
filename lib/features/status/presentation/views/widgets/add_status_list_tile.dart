import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/avatar_add_status.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/title_status.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddStatusListTile extends StatelessWidget {
  const AddStatusListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouters.kAddNewStatusView);
      },
      child: ListTile(
        leading: AvatarAddStatus(),
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
  }
}
