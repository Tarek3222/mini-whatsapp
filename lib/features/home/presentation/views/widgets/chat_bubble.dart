// ignore_for_file: deprecated_member_use

import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:clone_chat/core/utils/get_time_formated.dart';
import 'package:clone_chat/features/home/data/models/messege_model.dart';
import 'package:clone_chat/features/home/data/services/messeges_services.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/custom_build_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubbleFromMe extends StatelessWidget {
  const ChatBubbleFromMe({super.key, required this.messege});
  final MessegeModel messege;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          padding: EdgeInsets.symmetric(
              vertical: messege.type == Type.image ? 4 : 12,
              horizontal: messege.type == Type.image ? 6 : 16),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                messege.type == Type.image
                    ? CustomBuildNetworkImage(messegeUrl: messege.message!)
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          messege.message ?? '',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      getReadAndSentTimeFormated(
                          context: context, time: messege.sent ?? ''),
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (messege.read!.isNotEmpty)
                      const Icon(
                        Icons.done_all_outlined,
                        color: Colors.lightBlue,
                        size: 18,
                      ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class ChatBubbleFromFriend extends StatelessWidget {
  const ChatBubbleFromFriend({super.key, required this.messege});
  final MessegeModel messege;
  @override
  Widget build(BuildContext context) {
    //update last message read
    if (messege.read!.isEmpty) {
      MessegesServices().updateMessegeReadStatus(messege);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: messege.type == Type.image ? 4 : 12,
                horizontal: messege.type == Type.image ? 6 : 16),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.9),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  messege.type == Type.image
                      ? CustomBuildNetworkImage(messegeUrl: messege.message!)
                      : Text(
                          messege.message ?? '',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      getReadAndSentTimeFormated(
                          context: context, time: messege.sent ?? ''),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
