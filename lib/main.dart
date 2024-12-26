import 'dart:developer';

import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/core/themes/app_theme.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/features/settings/presentation/view_model/change_theme/change_theme_cubit.dart';
import 'package:clone_chat/features/settings/presentation/view_model/change_theme/change_theme_state.dart';
import 'package:clone_chat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';
import 'package:flutter_notification_channel/notification_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  notificationsChannel();
  setUpServiceLocator();
  runApp(const MiniChatApp());
}

class MiniChatApp extends StatelessWidget {
  const MiniChatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => ChangeThemeCubit()..init(),
          child: Builder(builder: (context) {
            return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
              builder: (context, state) {
                return MaterialApp.router(
                  routerConfig: AppRouters.router,
                  debugShowCheckedModeBanner: false,
                  title: 'Mini Chat',
                  theme: BlocProvider.of<ChangeThemeCubit>(context).isDarkMode
                      ? AppThemes.darkTheme
                      : AppThemes.lightTheme,
                );
              },
            );
          }),
        );
      },
    );
  }
}

notificationsChannel() async {
  var result = await FlutterNotificationChannel().registerNotificationChannel(
    description: 'for showing meessages notification',
    id: 'chats',
    importance: NotificationImportance.IMPORTANCE_HIGH,
    name: 'Chats',
    visibility: NotificationVisibility.VISIBILITY_PUBLIC,
    allowBubbles: true,
    enableVibration: true,
    enableSound: true,
    showBadge: true,
  );
  log(result);
}
