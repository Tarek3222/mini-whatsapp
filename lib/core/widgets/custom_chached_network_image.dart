import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChachedNetworkImage extends StatelessWidget {
  const CustomChachedNetworkImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl.isEmpty
          ? 'https://cdn-icons-png.flaticon.com/512/6927/6927593.png'
          : imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: 120.w,
        height: 120.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
