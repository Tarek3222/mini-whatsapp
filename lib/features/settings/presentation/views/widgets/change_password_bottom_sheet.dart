// ignore_for_file: use_build_context_synchronously

import 'package:clone_chat/core/function/show_snack_bar.dart';
import 'package:clone_chat/core/themes/styles.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/widgets/custom_loading_indecator.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:clone_chat/features/settings/presentation/views/widgets/change_password_field.dart';
import 'package:clone_chat/features/settings/presentation/views/widgets/custom_divider.dart';
import 'package:clone_chat/features/settings/presentation/views/widgets/saved_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordBottomSheet extends StatefulWidget {
  const ChangePasswordBottomSheet({super.key});

  @override
  State<ChangePasswordBottomSheet> createState() =>
      _ChangePasswordBottomSheetState();
}

class _ChangePasswordBottomSheetState extends State<ChangePasswordBottomSheet> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isPasswordVisible = true;
  bool isNewPasswordVisible = true;
  var formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  SharedPreferences prefs = getIt<SharedPreferences>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: formKey,
            autovalidateMode: autoValidate,
            child: Column(
              children: [
                CustomDivider(),
                const SizedBox(height: 20),
                ChangePasswordField(
                  label: 'Current Password',
                  hint: 'Enter your current password',
                  validate: (value) {
                    String password = prefs.getString('password') ?? '';
                    if (value!.isEmpty) {
                      return 'Please enter your current password';
                    }
                    if (value != password) {
                      return 'Current Password is not correct';
                    }
                    return null;
                  },
                  passwordController: currentPasswordController,
                  isPasswordVisible: isPasswordVisible,
                  togglePasswordVisibility: () {
                    setState(
                      () {
                        isPasswordVisible = !isPasswordVisible;
                      },
                    );
                  },
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'New Password',
                    style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ChangePasswordField(
                  label: 'New Password',
                  hint: 'Enter your new password',
                  passwordController: newPasswordController,
                  isPasswordVisible: isNewPasswordVisible,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your new password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                  togglePasswordVisibility: () {
                    setState(
                      () {
                        isNewPasswordVisible = !isNewPasswordVisible;
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                ChangePasswordField(
                  label: 'Confirm Password',
                  hint: 'Enter your confirm password',
                  passwordController: confirmPasswordController,
                  isPasswordVisible: isNewPasswordVisible,
                  togglePasswordVisibility: () {
                    setState(
                      () {
                        isNewPasswordVisible = !isNewPasswordVisible;
                      },
                    );
                  },
                ),
                const SizedBox(height: 60),
                isLoading
                    ? const CustomLoadingIndecator()
                    : SavedButton(
                        onSuccess: () async {
                          if (formKey.currentState!.validate()) {
                            try {
                              setState(() {
                                isLoading = true;
                              });
                              if (newPasswordController.text ==
                                  confirmPasswordController.text) {
                                await getIt.get<AuthServices>().updatePassword(
                                    password: newPasswordController.text);
                                await prefs.setString(
                                    'password', newPasswordController.text);
                                Navigator.pop(context);
                                showSnackBar(context,
                                    message: 'Password changed successfully');
                              } else {
                                showSnackBar(context,
                                    message: 'Password does not match');
                              }
                            } catch (e) {
                              showSnackBar(context, message: e.toString());
                            }
                          } else {
                            setState(() {
                              autoValidate = AutovalidateMode.always;
                            });
                          }
                          setState(
                            () {
                              isLoading = false;
                            },
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
