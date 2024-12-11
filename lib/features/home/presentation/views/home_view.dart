// ignore_for_file: deprecated_member_use

import 'package:clone_chat/features/calls/presentation/views/calls_view.dart';
import 'package:clone_chat/features/home/presentation/view_model/cubit/search_cubit.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/home_bottom_nav_bar.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/home_view_app_bar.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:clone_chat/features/status/presentation/views/status_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    const CallsView(),
  ];
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
          backgroundColor: Colors.white,
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
}
