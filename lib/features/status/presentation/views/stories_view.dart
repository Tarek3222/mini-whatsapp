import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/stories_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoriesView extends StatelessWidget {
  const StoriesView({super.key, required this.user});
  final ChatUser user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StoriesViewBody(
            stories: user.stories ?? [],
          ),
          Positioned(
            top: 50.h,
            left: 20.w,
            child: CircleAvatar(
              radius: 30.r,
              backgroundImage: NetworkImage(user.image ??
                  'https://cdn-icons-png.flaticon.com/512/6927/6927593.png'),
            ),
          ),
          Positioned(
            top: 50.h,
            left: 90.w,
            child: Text(
              user.uid == getIt.get<AuthServices>().auth.currentUser!.uid
                  ? 'My Status'
                  : user.name!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
