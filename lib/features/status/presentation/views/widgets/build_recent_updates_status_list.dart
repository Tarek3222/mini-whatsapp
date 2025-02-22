import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/core/widgets/custom_loading_indecator.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/custom_build_status.dart';
import 'package:flutter/material.dart';

class BuildRecentUpdatesStatusList extends StatelessWidget {
  const BuildRecentUpdatesStatusList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getIt.get<UserServices>().getMyUsers(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return CustomLoadingIndecator();
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return StreamBuilder(
                stream: getIt.get<UserServices>().getAllMyUsersStories(
                      usersId:
                          snapshot.data?.docs.map((e) => e.id).toList() ?? [],
                    ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CustomLoadingIndecator();
                  } else if (snapshot.hasData) {
                    List<ChatUser> users = snapshot.data?.docs
                            .map((doc) => ChatUser.fromJson(
                                doc.data() as Map<String, dynamic>))
                            .toList() ??
                        [];
                    // sort users by last updated time
                    users.sort(
                      (a, b) => b.stories![b.stories!.length - 1]['time']
                          .compareTo(a.stories![a.stories!.length - 1]['time']),
                    );
                    users = users.reversed.toList();
                    // sort users again by if current user show all stories
                    users.sort(
                      (a, b) => b.stories![b.stories!.length - 1]['Viewers']
                          .indexWhere((uid) =>
                              uid ==
                              getIt.get<AuthServices>().auth.currentUser!.uid)
                          .compareTo(
                            a.stories![a.stories!.length - 1]['Viewers']
                                .indexWhere((uid) =>
                                    uid ==
                                    getIt
                                        .get<AuthServices>()
                                        .auth
                                        .currentUser!
                                        .uid),
                          ),
                    );
                    users = users.reversed.toList();
                    return ListView.builder(
                      itemCount: users.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CustomBuildStatus(
                          user: users[index],
                          stories: users[index].stories ?? [],
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text('No Users Found'),
                    );
                  }
                },
              );
            } else {
              return Center(
                child: Text('No Users Found'),
              );
            }
        }
      },
    );
  }
}
