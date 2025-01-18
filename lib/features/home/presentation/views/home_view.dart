// ignore_for_file: deprecated_member_use

import 'package:clone_chat/core/constants/strings_constants.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:clone_chat/features/calls/presentation/views/calls_view.dart';
import 'package:clone_chat/features/groups/presentation/views/groups_view.dart';
import 'package:clone_chat/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/home_bottom_nav_bar.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/home_view_app_bar.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:clone_chat/features/status/presentation/views/status_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  bool isSearching = false;
  final List<Widget> _screens = [
    const ChatsView(),
    const StatusView(),
    const GroupsView(),
    const CallsView(),
  ];
  @override
  void initState() {
    onUserLogin();
    super.initState();
  }

  /// on App's user logout
  @override
  void dispose() {
    onUserLogout();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () {
          // if search is on back button will close search
          if (isSearching) {
            setState(() {
              isSearching = !isSearching;
            });
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: Scaffold(
          appBar: HomeViewAppBar(
            isSearching: isSearching,
            onSearchPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
              if (!isSearching) {
                BlocProvider.of<SearchCubit>(context).searchUser('');
              }
            },
          ),
          body: _screens[selectedIndex],
          bottomNavigationBar: HomeBottomNavBar(
            selectedIndex: selectedIndex,
            onTap: (value) {
              setState(
                () {
                  selectedIndex = value;
                },
              );
            },
          ),
        ),
      ),
    );
  }

  /// on App's user login
  void onUserLogin() {
    /// 1.2.1. initialized ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged in or re-logged in
    /// We recommend calling this method as soon as the user logs in to your app.
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: kAppId,
      appSign: kAppSign,
      userID: getIt.get<AuthServices>().auth.currentUser!.uid,
      userName: getIt.get<AuthServices>().auth.currentUser!.displayName!,
      plugins: [ZegoUIKitSignalingPlugin()],
    );
  }

  /// on App's user logout
  void onUserLogout() {
    /// 1.2.2. de-initialization ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged out
    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }
}
