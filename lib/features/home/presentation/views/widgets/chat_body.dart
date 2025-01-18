// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:io';

import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:clone_chat/core/widgets/custom_loading_indecator.dart';
import 'package:clone_chat/features/home/data/services/messeges_services.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/build_chat_bubble_list_view.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/build_custom_emoji.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/chat_message_field.dart';
import 'package:flutter/material.dart';
import 'package:clone_chat/features/home/data/models/messege_model.dart';
import 'package:image_picker/image_picker.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key, required this.chatUser});
  final ChatUser chatUser;

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool isShowingEmoji = false;
  bool isUploadingImage = false;
  List<MessegeModel> messeges = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isShowingEmoji) {
          setState(() {
            isShowingEmoji = false;
          });
          return false;
        }
        return true;
      },
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: MessegesServices().getAllMesseges(widget.chatUser),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return CustomLoadingIndecator();

                    case ConnectionState.done:
                    case ConnectionState.active:
                      if (snapshot.hasData) {
                        var data = snapshot.data?.docs;
                        messeges = data
                                ?.map(
                                  (doc) => MessegeModel.fromJson(
                                      doc.data() as Map<String, dynamic>),
                                )
                                .toList() ??
                            [];
                        if (messeges.isNotEmpty) {
                          return BuildChatBubbleListView(
                            user: widget.chatUser,
                            messeges: messeges,
                            scrollController: scrollController,
                          );
                        } else {
                          return Center(
                            child: Text(
                              'Say Hello To Your Friend! 😍',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                          );
                        }
                      } else {
                        return const Center(
                          child: Text(
                            'No Messages Available!',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }
                  }
                }),
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isShowingEmoji = !isShowingEmoji;
                            });
                            if (isShowingEmoji) {
                              FocusScope.of(context).unfocus();
                            }
                          },
                          icon: Icon(
                            Icons.emoji_emotions,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Expanded(
                          child: ChatMessageField(
                              messageController: messageController,
                              onTap: () {
                                setState(() {
                                  isShowingEmoji = false;
                                });
                              }),
                        ),
                        IconButton(
                          onPressed: () async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? imageGellery = await picker.pickImage(
                                source: ImageSource.camera, imageQuality: 80);
                            if (imageGellery != null) {
                              setState(() {
                                isUploadingImage = true;
                              });
                              await MessegesServices().sendImage(
                                widget.chatUser,
                                File(imageGellery.path),
                              );
                              setState(() {
                                isUploadingImage = false;
                              });
                              if (scrollController.hasClients) {
                                scrollController.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.fastOutSlowIn,
                                );
                              }
                            }
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            final ImagePicker picker = ImagePicker();
                            final List<XFile> imagesGellery =
                                await picker.pickMultiImage(imageQuality: 70);

                            if (imagesGellery.isNotEmpty) {
                              for (var element in imagesGellery) {
                                setState(() {
                                  isUploadingImage = true;
                                });
                                await MessegesServices().sendImage(
                                  widget.chatUser,
                                  File(element.path),
                                );
                                setState(() {
                                  isUploadingImage = false;
                                });
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
                          icon: Icon(
                            Icons.image_rounded,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      if (messeges.isEmpty) {
                        MessegesServices().sendFirstMessage(
                          widget.chatUser,
                          messageController.text.trim(),
                          Type.text,
                        );
                      } else {
                        MessegesServices().sendMessage(
                          widget.chatUser,
                          messageController.text.trim(),
                          Type.text,
                        );
                      }
                      messageController.clear();
                      if (scrollController.hasClients) {
                        scrollController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.fastOutSlowIn,
                        );
                      }
                    }
                  },
                  icon: Icon(
                    Icons.send,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          if (isShowingEmoji)
            BuildCustomEmoji(messegeController: messageController),
        ],
      ),
    );
  }
}
