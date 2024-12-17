// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/core/themes/styles.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/core/widgets/show_awsome_dialog.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:clone_chat/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeViewAppBar(
      {super.key, required this.isSearching, required this.onSearchPressed});
  final bool isSearching;
  final VoidCallback onSearchPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.5,
          color: Colors.grey,
        ),
      ),
      title: isSearching
          ? buildTextField(context)
          : Text(
              'WhatsUp',
              style: Styles.textStyle24SemiBold(context).copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
      actions: [
        IconButton(
          onPressed: onSearchPressed,
          icon: Icon(isSearching ? Icons.close : Icons.search),
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
                onTap: () {
                  GoRouter.of(context).push(AppRouters.kSettingsView);
                },
              ),
              PopupMenuItem(
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  showAwsomeDialog(
                    message: 'Do you want to logout?',
                    context: context,
                    title: 'Logout',
                    dialogType: DialogType.warning,
                    btnOkOnPress: () async {
                      await UserServices().updateActiveStatus(isOnline: false);
                      await getIt<AuthServices>().logout();
                      GoRouter.of(context)
                          .pushReplacement(AppRouters.kLoginView);
                    },
                    btnCancelOnPress: () {},
                  );
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

  Widget buildTextField(context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for a chat',
        hintStyle: TextStyle(letterSpacing: 1.2),
        border: InputBorder.none,
      ),
      autofocus: true,
      style: TextStyle(letterSpacing: 1.2),
      onChanged: (value) {
        if (value.isNotEmpty) {
          BlocProvider.of<SearchCubit>(context).searchUser(value);
        } else {
          BlocProvider.of<SearchCubit>(context).searchUser(value);
        }
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
