import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constants/assets_images.dart';

class ChatAiButton extends StatelessWidget {
  const ChatAiButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        GoRouter.of(context).push(AppRouters.kChatAiView);
      },
      icon: Lottie.asset(
        AssetsImages.geminiImage,
        height: 70.h,
        width: 70.w,
      ),
    );
  }
}
