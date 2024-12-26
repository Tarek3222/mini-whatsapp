import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterRow extends StatelessWidget {
  const RegisterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account?',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouters.kSignUpView);
          },
          child: Text(
            'Register here',
            style: Styles.textStyle15SemiBold(context),
          ),
        ),
      ],
    );
  }
}
