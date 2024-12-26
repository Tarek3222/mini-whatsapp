import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:clone_chat/core/function/show_snack_bar.dart';
import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:clone_chat/core/utils/get_time_formated.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/core/widgets/custom_chached_network_image.dart';
import 'package:clone_chat/core/widgets/show_awsome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildCustomMyStatusItem extends StatelessWidget {
  const BuildCustomMyStatusItem({super.key, required this.story});
  final Map<String, dynamic> story;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: story['type'] == 'image'
          ? CustomChachedNetworkImage(
              imageUrl: story['content'],
              height: 50.h,
            )
          : CircleAvatar(
              radius: 30.r,
              backgroundColor: AppColors.primaryColor,
              child: Text('Video'),
            ),
      title: Text(
        'views: ${story['Viewers'].length}',
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      subtitle: Text(
        getTimeStoryFormated(
          context: context,
          time: story['time'],
        ),
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          deleteStory(context);
        },
        icon: const Icon(
          Icons.delete_forever_rounded,
          color: Colors.red,
        ),
      ),
    );
  }

  deleteStory(context) {
    showAwsomeDialog(
      message: 'Are you sure you want to delete this story?',
      context: context,
      title: 'Delete Story',
      dialogType: DialogType.question,
      btnOkOnPress: () async {
        try {
          await getIt<UserServices>().deleteStory(story: story);
          showSnackBar(context, message: 'Story deleted successfully');
        } catch (e) {
          showSnackBar(context, message: 'Something went wrong');
        }
      },
      btnCancelOnPress: () {},
    );
  }
}
