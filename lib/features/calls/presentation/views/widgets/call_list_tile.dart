import 'package:clone_chat/core/constants/assets_images.dart';
import 'package:flutter/material.dart';

class CallListTile extends StatelessWidget {
  const CallListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(
          AssetsImages.profileImage,
        ),
      ),
      title: Text(
        'Tarek',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'Today, 10:30 AM',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
      ),
      trailing: Icon(Icons.call),
    );
  }
}
