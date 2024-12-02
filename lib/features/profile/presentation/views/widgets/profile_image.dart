import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.imageProfile = '', this.onTap});
  final String imageProfile;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InstaImageViewer(
          imageUrl: imageProfile.isEmpty
              ? 'https://cdn-icons-png.flaticon.com/512/6927/6927593.png'
              : imageProfile,
          child: CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
              imageProfile.isEmpty
                  ? 'https://cdn-icons-png.flaticon.com/512/6927/6927593.png'
                  : imageProfile,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
