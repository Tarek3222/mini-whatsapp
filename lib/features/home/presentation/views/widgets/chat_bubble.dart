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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              if (messege.read!.isNotEmpty)
                const Icon(
                  Icons.done_all_outlined,
                  color: Colors.blue,
                ),
              const SizedBox(
                width: 5,
              ),
              Text(
                getReadAndSentTimeFormated(
                    context: context, time: messege.sent ?? ''),
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(messege.type == Type.image ? 4 : 12),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: messege.type == Type.image
                ? CustomBuildNetworkImage(messegeUrl: messege.message!)
                : Text(
                    messege.message ?? '',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
          ),
        ),
      ],
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
        Flexible(
          child: Container(
            padding: EdgeInsets.all(messege.type == Type.image ? 4 : 12),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue[200],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: messege.type == Type.image
                ? CustomBuildNetworkImage(messegeUrl: messege.message!)
                : Text(
                    messege.message ?? '',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            getReadAndSentTimeFormated(
                context: context, time: messege.sent ?? ''),
            style: TextStyle(color: Colors.black45),
          ),
        ),
      ],
    );
  }
}
