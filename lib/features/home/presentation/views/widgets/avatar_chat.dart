import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:clone_chat/core/widgets/custom_chached_network_image.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/custom_build_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AvatarChat extends StatelessWidget {
  const AvatarChat(
      {super.key, this.redius = 50, required this.user, this.isFromChat});
  final double? redius;
  final ChatUser user;
  final bool? isFromChat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isFromChat == true
          ? null
          : () {
              showAlertDialog(context);
            },
      child: CustomChachedNetworkImage(
        imageUrl: user.image ?? '',
        height: redius?.w,
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    var alert = AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28.r),
      ),
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomBuildNetworkImage(
            messegeUrl: user.image!,
            width: double.infinity,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28.r),
              topRight: Radius.circular(28.r),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  GoRouter.of(context)
                      .push(AppRouters.kUserProfile, extra: user);
                },
                icon: const Icon(
                  Icons.info,
                  color: AppColors.primaryColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  GoRouter.of(context).push(AppRouters.kChatView, extra: user);
                },
                icon: const Icon(
                  Icons.message_rounded,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
