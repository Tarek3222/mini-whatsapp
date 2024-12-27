// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:clone_chat/core/function/show_snack_bar.dart';
import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/widgets/custom_loading_indecator.dart';
import 'package:clone_chat/core/widgets/show_awsome_dialog.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/email_field.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/login_button.dart';
import 'package:flutter/material.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Column(
        spacing: 40,
        children: [
          EmailField(
            emailController: emailController,
          ),
          isLoading
              ? const CustomLoadingIndecator()
              : LoginButton(
                  onTap: () async {
                    if (emailController.text.isNotEmpty &&
                        emailController.text.contains('@')) {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        if (await getIt
                            .get<AuthServices>()
                            .userExists(email: emailController.text.trim())) {
                          await getIt<AuthServices>().resetPassword(
                            email: emailController.text.trim(),
                          );
                          Navigator.pop(context);
                          showSnackBar(
                            context,
                            message: 'Check your email to reset password',
                            color: AppColors.primaryColor,
                            margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.83,
                              left: 20,
                              right: 20,
                            ),
                          );
                        } else {
                          showAwsomeDialog(
                            message:
                                'Go to create account and verify your email',
                            context: context,
                            title: 'Email not Registered',
                            dialogType: DialogType.error,
                            btnOkOnPress: () {},
                          );
                        }
                      } catch (e) {
                        showAwsomeDialog(
                          message:
                              'Please enter a valid email, to reset password $e',
                          context: context,
                          title: 'Error',
                          dialogType: DialogType.error,
                          btnOkOnPress: () {},
                        );
                      }
                      setState(() {
                        isLoading = false;
                      });
                    } else {
                      showAwsomeDialog(
                        message:
                            'Please enter a valid email, to reset password',
                        context: context,
                        title: 'Error',
                        dialogType: DialogType.error,
                        btnOkOnPress: () {},
                      );
                    }
                  },
                  text: 'Send',
                ),
        ],
      ),
    );
  }
}
