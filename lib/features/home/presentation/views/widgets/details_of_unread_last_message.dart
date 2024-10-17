import 'package:clone_chat/features/home/presentation/views/widgets/build_number_of_unread_message.dart';
import 'package:flutter/material.dart';

class DetailsOfUnreadLastMessage extends StatelessWidget {
  const DetailsOfUnreadLastMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '10:00 AM',
        ),
        SizedBox(
          height: 5,
        ),
        BuildNumberOfUnreadMessages(),
      ],
    );
  }
}
