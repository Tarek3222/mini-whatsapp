import 'package:clone_chat/features/settings/presentation/views/widgets/settings_body.dart';
import 'package:clone_chat/features/settings/presentation/views/widgets/settings_view_app_bar.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SettingsViewAppBar(),
      body: SettingsBody(),
    );
  }
}
