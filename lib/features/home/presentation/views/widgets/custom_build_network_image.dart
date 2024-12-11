import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBuildNetworkImage extends StatelessWidget {
  const CustomBuildNetworkImage(
      {super.key,
      required this.messegeUrl,
      this.height,
      this.width,
      this.borderRadius});
  final String messegeUrl;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: messegeUrl,
      placeholder: (context, url) => CircularProgressIndicator(),
      imageBuilder: (context, imageProvider) => Container(
        width: width ?? 200.w,
        height: height ?? 200.h,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(30),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Column(
        children: [
          Icon(Icons.error),
          Text(
            'Faild to load image',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
