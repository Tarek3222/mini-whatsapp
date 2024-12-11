import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/get_time_formated.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/avatar_chat.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/name_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChatViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatViewAppBar({super.key, required this.chatUser});
  final ChatUser chatUser;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      title: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRouters.kUserProfile, extra: chatUser);
        },
        child: Row(
          children: [
            const SizedBox(width: 15),
            AvatarChat(
              user: chatUser,
              redius: 50,
              isFromChat: true,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NameChat(
                  name: chatUser.name ?? 'unknown user',
                ),
                Text(
                  chatUser.isOnline!
                      ? 'Online'
                      : getLastActiveTime(
                          context: context,
                          lastActive: chatUser.lastActive!,
                        ),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: chatUser.isOnline! ? Colors.green : Colors.black54,
                      fontSize: 12.sp),
                ),
              ],
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.5,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
