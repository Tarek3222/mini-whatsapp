import 'package:clone_chat/core/constants/strings_constants.dart';
import 'package:clone_chat/core/themes/styles.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/widgets/custom_chached_network_image.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:clone_chat/features/groups/data/models/group_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBuildGroupItem extends StatelessWidget {
  const CustomBuildGroupItem({super.key, required this.group});
  final GroupChatModel group;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: group.id!,
        child: CustomChachedNetworkImage(
          imageUrl: group.image ?? kImageGroupDefault,
          height: 50.h,
        ),
      ),
      title: Text(
        group.name ?? 'unknown',
        style: Styles.font22Bold(context),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        group.lastMessage!.isEmpty
            ? group.description!
            : '${group.lastUserId == getIt<AuthServices>().auth.currentUser!.uid ? 'You' : group.lastUserSentMessage}: ${group.lastMessage}',
        style: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
