import 'package:clone_chat/features/home/presentation/views/widgets/home_bottom_nav_bar.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/home_view_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const HomeViewAppBar(),
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
    );
  }
}
