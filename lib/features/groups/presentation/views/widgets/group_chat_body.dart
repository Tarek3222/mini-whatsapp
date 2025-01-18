// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:clone_chat/core/function/show_snack_bar.dart';
import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/features/groups/data/models/group_chat_model.dart';
import 'package:clone_chat/features/groups/data/services/chat_group_services.dart';
import 'package:clone_chat/features/groups/presentation/views/widgets/build_stream_group_chat.dart';
import 'package:clone_chat/features/groups/presentation/views/widgets/custom_input_field_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class GroupChatBody extends StatefulWidget {
  const GroupChatBody({super.key, required this.group});
  final GroupChatModel group;
  @override
  State<GroupChatBody> createState() => _GroupChatBodyState();
}

class _GroupChatBodyState extends State<GroupChatBody> {
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool isUploadingImage = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SafeArea(
          child: SizedBox(),
        ),
        Expanded(
          child: BuildStreamGroupChat(
            scrollController: scrollController,
            group: widget.group,
          ),
        ),
        if (isUploadingImage)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 16),
              child: const CircularProgressIndicator(
                color: AppColors.primaryColor,
                strokeWidth: 2,
              ),
            ),
          ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Row(
            children: [
              Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 30,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomInputFieldMessage(
                          controller: messageController,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.image,
                        ),
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          final List<XFile> imagesGellery =
                              await picker.pickMultiImage(imageQuality: 70);

                          if (imagesGellery.isNotEmpty) {
                            for (var element in imagesGellery) {
                              setState(
                                () {
                                  isUploadingImage = true;
                                },
                              );
                              await getIt.get<ChatGroupServices>().sendImage(
                                    groupId: widget.group.id!,
                                    file: File(element.path),
                                  );
                              setState(
                                () {
                                  isUploadingImage = false;
                                },
                              );
                              if (scrollController.hasClients) {
                                scrollController.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.fastOutSlowIn,
                                );
                              }
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send, color: AppColors.primaryColor),
                onPressed: () {
                  if (messageController.text.isNotEmpty) {
                    getIt
                        .get<ChatGroupServices>()
                        .sendMessage(
                          msg: messageController.text,
                          groupId: widget.group.id!,
                          type: 'text',
                        )
                        .then(
                      (value) {
                        messageController.clear();
                        if (scrollController.hasClients) {
                          scrollController.animateTo(
                            0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.fastOutSlowIn,
                          );
                        }
                      },
                    ).catchError(
                      (e) {
                        showSnackBar(context, message: 'something went wrong');
                      },
                    );
                  } else {
                    showSnackBar(
                      context,
                      message: 'message is empty',
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height - 140.h,
                        left: 24,
                        right: 24,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
