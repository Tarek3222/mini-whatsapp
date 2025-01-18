// ignore_for_file: deprecated_member_use

import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:clone_chat/core/themes/styles.dart';
import 'package:clone_chat/core/utils/get_time_formated.dart';
import 'package:clone_chat/features/groups/data/models/group_message_model.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/custom_build_network_image.dart';
import 'package:flutter/material.dart';

class CustomBubbleMessage extends StatelessWidget {
  const CustomBubbleMessage({super.key, required this.message});
  final GroupMessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${message.nameUser ?? 'unknown'} (You)⚡',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              message.type == 'image'
                  ? CustomBuildNetworkImage(messegeUrl: message.message!)
                  : Text(
                      '${message.message}',
                      style: Styles.font18SemiBold(context)
                          .copyWith(color: Colors.white),
                    ),
              const SizedBox(
                  height: 8), // Optional spacing between message and time
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  getTimeMessageGroupFormated(
                      context: context, time: message.date!),
                  style: Styles.font14Medium(context).copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBubbleMessagefriend extends StatelessWidget {
  const CustomBubbleMessagefriend({
    super.key,
    required this.message,
  });
  final GroupMessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align time to the right
            children: [
              Text(
                '${message.nameUser ?? 'unknown'}⚡',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              message.type == 'image'
                  ? CustomBuildNetworkImage(messegeUrl: message.message!)
                  : Text(
                      '${message.message}',
                      style: Styles.font18SemiBold(context)
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  getTimeMessageGroupFormated(
                      context: context, time: message.date!),
                  style: Styles.font14Medium(context)
                      .copyWith(color: Colors.white.withOpacity(0.7)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
