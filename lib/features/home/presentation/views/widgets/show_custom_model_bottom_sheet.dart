// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:clone_chat/core/function/show_snack_bar.dart';
import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/get_time_formated.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/widgets/custom_snack_bar.dart';
import 'package:clone_chat/core/widgets/show_awsome_dialog.dart';
import 'package:clone_chat/features/home/data/models/messege_model.dart';
import 'package:clone_chat/features/home/data/services/messeges_services.dart';
import 'package:clone_chat/features/home/presentation/views/widgets/options_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';

class ShowCustomModelBottomSheet extends StatelessWidget {
  const ShowCustomModelBottomSheet(
      {super.key,
      required this.message,
      required this.isMe,
      required this.user});
  final MessegeModel message;
  final ChatUser user;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4.h,
                width: 70.w,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              message.type == Type.text
                  ? OptionsItem(
                      title: 'Copy Message',
                      icon: Icons.copy,
                      onTap: () async {
                        await Clipboard.setData(
                          ClipboardData(
                              text: message.message ?? 'undefined Message'),
                        );
                      },
                      color: Colors.blue,
                    )
                  : OptionsItem(
                      title: 'Download Image',
                      icon: Icons.download_rounded,
                      onTap: () async {
                        try {
                          await GallerySaver.saveImage(
                            message.message!,
                            albumName: 'Chat Images',
                          ).then(
                            (success) {
                              Navigator.pop(context);
                              if (success != null && success) {
                                showSnackBar(context,
                                    message: 'Image Downloaded Successfully');
                              }
                            },
                          );
                        } catch (e) {
                          showSnackBar(context,
                              message: 'Something went wrong');
                        }
                      },
                      color: Colors.blue,
                    ),
              Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              isMe
                  ? message.type == Type.text
                      ? Column(
                          children: [
                            OptionsItem(
                              title: 'Edit Message',
                              icon: Icons.edit,
                              onTap: () {
                                updateMessage(context);
                              },
                              color: Colors.green,
                            ),
                            OptionsItem(
                              title: 'Delete Message',
                              icon: Icons.delete,
                              onTap: () {
                                deleteMessage(context);
                              },
                              color: Colors.red,
                            ),
                          ],
                        )
                      : OptionsItem(
                          title: 'Delete Image',
                          icon: Icons.delete,
                          onTap: () {
                            deleteMessage(context);
                          },
                          color: Colors.red,
                        )
                  : SizedBox(),
              Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              OptionsItem(
                title:
                    'Sent At: ${getReadAndSentTimeFormated(context: context, time: message.sent!)}',
                icon: Icons.done_rounded,
                onTap: () {},
                color: Colors.grey,
              ),
              OptionsItem(
                title: message.read == ''
                    ? 'Read At: Not seen yet'
                    : 'Read At: ${getReadAndSentTimeFormated(context: context, time: message.read!)}',
                icon: Icons.done_all_outlined,
                onTap: () {},
                color: Colors.lightBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  deleteMessage(context) {
    showAwsomeDialog(
      message: 'Are you sure to delete message?',
      context: context,
      title: 'Delete Message',
      dialogType: DialogType.question,
      btnOkOnPress: () async {
        await getIt.get<MessegesServices>().deleteMessege(message, user).then(
          (value) {
            Navigator.pop(context);
          },
        ).catchError(
          (error) {
            customSnackBar(text: 'there is an error, please try again');
          },
        );
      },
      btnCancelOnPress: () {},
    );
  }

  updateMessage(context) {
    TextEditingController controller = TextEditingController();
    final formKey = GlobalKey<FormState>();
    controller.text = message.message!;
    var dialog = AlertDialog(
      title: Text('Update Message'),
      content: Form(
        key: formKey,
        child: TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'message must not be empty';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'Enter new message',
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              message.message = controller.text;
              getIt
                  .get<MessegesServices>()
                  .updateMessage(
                    message,
                  )
                  .then((value) {
                Navigator.pop(context); // Close the dialog
                Navigator.pop(context); // Close the bottom sheet
              }).catchError((error) {
                Navigator.pop(context);
                Navigator.pop(context);
                customSnackBar(text: 'there is an error, please try again');
              });
            }
          },
          child: Text('Update'),
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }
}
