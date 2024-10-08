// ignore_for_file: use_build_context_synchronously
import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/core/constants/assets_images.dart';
import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:clone_chat/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    initScalingAnimation();
    navigateToLogin();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _animation,
            child: Image.asset(
              AssetsImages.logo,
              height: 180,
            ),
          ),
          Text(
            'WhatsUp',
            style: Styles.textStyle24.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Text('The best chat app of this century'),
        ],
      ),
    );
  }

  void navigateToLogin() {
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        GoRouter.of(context).pushReplacement(AppRouters.kLoginView);
      },
    );
  }

  void initScalingAnimation() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    )..repeat();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCirc,
    );
  }
}
