import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:clone_chat/features/groups/presentation/views/widgets/build_bottom_sheet_new_group.dart';
import 'package:flutter/material.dart';

class CustomButtonNewGroup extends StatelessWidget {
  const CustomButtonNewGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Scaffold.of(context).showBottomSheet(
          (context) => TapRegion(
            onTapOutside: (_) => Navigator.of(context).pop(),
            child: BuildBottomSheetNewGroup(),
          ),
        );
      },
      backgroundColor: AppColors.primaryColor,
      child: const Icon(
        Icons.group_add,
        color: Colors.white,
      ),
    );
  }
}
