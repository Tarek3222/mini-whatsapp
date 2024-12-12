import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/core/widgets/custom_loading_indecator.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/build_custom_my_status_item.dart';
import 'package:flutter/material.dart';

class BuildAllMyStatus extends StatelessWidget {
  const BuildAllMyStatus({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getIt.get<UserServices>().getCurrentUserStories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ChatUser user = ChatUser.fromJson(
                snapshot.data!.data()! as Map<String, dynamic>);
            List stories = user.stories ?? [];
            return ListView.separated(
              itemCount: stories.length,
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
                thickness: 1,
                endIndent: 50,
                indent: 50,
              ),
              itemBuilder: (context, index) {
                return BuildCustomMyStatusItem(
                  story: stories[index],
                );
              },
            );
          } else {
            return const CustomLoadingIndecator();
          }
        });
  }
}
