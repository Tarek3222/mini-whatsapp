// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/core/function/show_snack_bar.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/core/widgets/show_awsome_dialog.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:clone_chat/features/settings/presentation/views/widgets/change_password_bottom_sheet.dart';
import 'package:clone_chat/features/settings/presentation/views/widgets/custom_list_tile.dart';
import 'package:clone_chat/features/settings/presentation/views/widgets/custom_list_tile_with_tralling.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTileWithTralling(
          icon: Icons.dark_mode,
          title: 'Dark Mode',
          switchValue: true,
          onChanged: (value) {},
        ),
        CustomListTileWithTralling(
          icon: Icons.notifications,
          title: 'Notifications',
          switchValue: false,
          onChanged: (value) {},
        ),
        CustomListTile(
          title: 'Change Password',
          icon: Icons.lock,
          onTap: () {
            showBottomSheet(
              context: context,
              builder: (context) {
                return ChangePasswordBottomSheet();
              },
            );
          },
        ),
        CustomListTile(
          title: 'Contact Us',
          icon: Icons.email,
          onTap: () {
            launchUrlString('mailto:tarekahmebelal@gmail.com');
          },
        ),
        CustomListTile(
          title: 'Privacy Policy',
          icon: Icons.policy,
          onTap: () {
            launchUrlString(
                'https://www.whatsapp.com/legal/?lg=ar&lc=EG&eea=0');
          },
        ),
        CustomListTile(
          title: 'About',
          icon: Icons.info,
          onTap: () {
            var alertDialog = AlertDialog(
              backgroundColor: Colors.white,
              title: const Text('About WhatsUp'),
              content: const Text(
                  'This is a clone of WhatsUp App allow user to chat with each other'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            );
            showDialog(context: context, builder: (context) => alertDialog);
          },
        ),
        CustomListTile(
          title: 'Logout',
          icon: Icons.logout,
          color: Colors.red,
          onTap: () async {
            UserServices().updateActiveStatus(isOnline: false);
            await getIt<AuthServices>().logout();
            Navigator.pop(context);
            GoRouter.of(context).pushReplacement(AppRouters.kLoginView);
          },
        ),
        CustomListTile(
          title: 'Delete Account',
          icon: Icons.delete,
          color: Colors.red,
          onTap: () async {
            showAwsomeDialog(
              message: 'Are you sure to delete your account?',
              context: context,
              title: 'Delete Account',
              dialogType: DialogType.question,
              btnOkOnPress: () async {
                try {
                  await getIt<AuthServices>().deleteAccount();
                  Navigator.pop(context);
                  GoRouter.of(context).pushReplacement(AppRouters.kLoginView);
                } catch (e) {
                  showSnackBar(context,
                      message: 'something went wrong, try again!');
                }
              },
              btnCancelOnPress: () {},
            );
          },
        ),
      ],
    );
  }
}
