import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/features/home/data/services/notifications_services.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/chats_tab_body.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/new_messege_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({super.key});

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView> {
  @override
  void initState() {
    // for setting active status(update)
    UserServices().updateActiveStatus(isOnline: true);
    NotificationsServices().getFirebaseMessagingToken();
    SystemChannels.lifecycle.setMessageHandler((message) {
      if (message!.contains('resume')) {
        UserServices().updateActiveStatus(isOnline: true);
      }
      if (message.contains('pause')) {
        UserServices().updateActiveStatus(isOnline: false);
      }
      if (message.contains('inactive')) {
        UserServices().updateActiveStatus(isOnline: false);
      }

      return Future.value(message);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ChatsTabBody(),
        AnimatedPositioned(
          duration: const Duration(seconds: 1),
          bottom: 20,
          right: 20,
          child: const NewMessegeButton(),
        )
      ],
    );
  }
}
