// ignore_for_file: use_build_context_synchronously

import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/core/themes/styles.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.5,
          color: Colors.grey,
        ),
      ),
      title: Text(
        'WhatsUp',
        style: Styles.textStyle24.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        PopupMenuButton(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              width: 0.5,
              color: Colors.grey,
            ),
          ),
          position: PopupMenuPosition.under,
          tooltip: 'more',
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text('Profile'),
                onTap: () {
                  GoRouter.of(context).push(AppRouters.kProfileView);
                },
              ),
              PopupMenuItem(
                child: Text('New Group'),
                onTap: () {},
              ),
              PopupMenuItem(
                child: Text('Settings'),
                onTap: () {},
              ),
              PopupMenuItem(
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onTap: () async {
                  await getIt<AuthServices>().logout();
                  GoRouter.of(context).pushReplacement(AppRouters.kLoginView);
                },
              ),
            ];
          },
          child: Icon(Icons.more_vert),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
