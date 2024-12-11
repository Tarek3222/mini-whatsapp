import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class UserProfileBody extends StatelessWidget {
  const UserProfileBody({super.key, required this.user});
  final ChatUser user;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        buildSliverAppBar(context),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.green.shade600),
                    title: Text(user.email!),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.green.shade600),
                    title: Text(user.phone ?? 'number not found'),
                  ),
                  ListTile(
                    leading: Icon(Icons.info, color: Colors.green.shade600),
                    title: Text(
                      user.about ?? "Here there, i'm using clone chat",
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  SliverAppBar buildSliverAppBar(context) {
    return SliverAppBar(
      expandedHeight: 450.h,
      pinned: true,
      stretch: true,
      leading: const BackButton(
        color: Colors.white,
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          user.name!,
          style: Styles.textStyle24.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        background: InstaImageViewer(
          imageUrl: user.image!.isEmpty
              ? 'https://cdn-icons-png.flaticon.com/512/6927/6927593.png'
              : user.image,
          child: CachedNetworkImage(
            imageUrl: user.image!.isEmpty
                ? 'https://cdn-icons-png.flaticon.com/512/6927/6927593.png'
                : user.image!,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
