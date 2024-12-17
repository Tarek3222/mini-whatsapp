import 'package:clone_chat/core/function/show_snack_bar.dart';
import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:clone_chat/core/themes/styles.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:flutter/material.dart';

class NewMessegeButton extends StatelessWidget {
  const NewMessegeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        addUser(context);
      },
      backgroundColor: AppColors.primaryColor,
      child: const Icon(
        Icons.message,
        color: Colors.white,
      ),
    );
  }

  addUser(context) {
    TextEditingController controller = TextEditingController();
    final formKey = GlobalKey<FormState>();
    var dialog = AlertDialog(
      title: Text(
        'Create New Chat',
        style: Styles.textStyle15SemiBold(context),
      ),
      content: Form(
        key: formKey,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email address';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'Email New User',
            prefixIcon: Icon(
              Icons.email,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: Text(
            'Cancel',
            style: Styles.textStyle15SemiBold(context).copyWith(
              color: Colors.red,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              getIt
                  .get<UserServices>()
                  .addNewChatUser(email: controller.text)
                  .then((value) {
                if (!value) {
                  Navigator.pop(context);
                  showSnackBar(context, message: 'user not exists');
                } else {
                  Navigator.pop(context);
                  showSnackBar(context, message: 'user added');
                }
              });
            }
          },
          child: Text(
            'add',
            style: Styles.textStyle15SemiBold(context),
          ),
        ),
      ],
    );

    showDialog(
        barrierDismissible: false,
        barrierColor:
            Colors.white.withValues(alpha: 0, red: 0, green: 0, blue: 0.5),
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }
}
