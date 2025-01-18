import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildCustomEmoji extends StatelessWidget {
  const BuildCustomEmoji({super.key, required this.messegeController});
  final TextEditingController messegeController;

  @override
  Widget build(BuildContext context) {
    return EmojiPicker(
      textEditingController:
          messegeController, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
      config: Config(
        height: 256.h,
        checkPlatformCompatibility: true,
        emojiViewConfig: EmojiViewConfig(
          // Issue: https://github.com/flutter/flutter/issues/28894
          emojiSizeMax: 28 * (Platform.isIOS ? 1.20 : 1.0),
        ),
        viewOrderConfig: const ViewOrderConfig(
          top: EmojiPickerItem.categoryBar,
          middle: EmojiPickerItem.emojiView,
        ),
        skinToneConfig: const SkinToneConfig(),
        categoryViewConfig: const CategoryViewConfig(),
        bottomActionBarConfig: const BottomActionBarConfig(),
      ),
    );
  }
}
