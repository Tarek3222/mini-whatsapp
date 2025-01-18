import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/get_time_formated.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/avatar_chat.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/name_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class ChatViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatViewAppBar({super.key, required this.chatUser});
  final ChatUser chatUser;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Expanded(
            child: ListTile(
              onTap: () {
                GoRouter.of(context)
                    .push(AppRouters.kUserProfile, extra: chatUser);
              },
              contentPadding: EdgeInsets.zero,
              leading: AvatarChat(
                user: chatUser,
                redius: 50,
                isFromChat: true,
              ),
              title: NameChat(
                name: chatUser.name ?? 'unknown user',
              ),
              subtitle: Text(
                chatUser.isOnline!
                    ? 'Online'
                    : getLastActiveTime(
                        context: context,
                        lastActive: chatUser.lastActive!,
                      ),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: chatUser.isOnline!
                          ? Colors.green
                          : Theme.of(context).colorScheme.secondary,
                      fontSize: 12.sp,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
      actions: [
        actionButton(false),
        SizedBox(width: 5.w),
        actionButton(true),
        SizedBox(width: 5.w),
      ],
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

  ZegoSendCallInvitationButton actionButton(bool isVideo) {
    return ZegoSendCallInvitationButton(
      isVideoCall: isVideo,
      //You need to use the resourceID that you created in the subsequent steps.
      //Please continue reading this document.
      resourceID: "zegouikit_call",
      invitees: [
        ZegoUIKitUser(
          id: chatUser.uid!,
          name: chatUser.name!,
        ),
      ],
      iconSize: Size(40.w, 40.h),
      buttonSize: Size(40.w, 40.h),
    );
  }
}
