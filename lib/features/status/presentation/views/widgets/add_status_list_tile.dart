import 'package:clone_chat/features/status/presentation/views/widgets/avatar_add_status.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/title_status.dart';
import 'package:flutter/material.dart';

class AddStatusListTile extends StatelessWidget {
  const AddStatusListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AvatarAddStatus(),
      title: TitleStatus(title: 'My Status'),
      subtitle: Text(
        'Tap to add status update',
        style: TextStyle(
          color: Colors.grey.withOpacity(0.7),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
