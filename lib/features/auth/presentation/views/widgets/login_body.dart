// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/core/function/show_snack_bar.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/widgets/custom_loading_indecator.dart';
import 'package:clone_chat/core/widgets/show_awsome_dialog.dart';
import 'package:clone_chat/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:clone_chat/features/auth/presentation/view_model/login_cubit/login_state.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/email_field.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/forget_password_widget.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/login_button.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/login_title.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/password_field.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/register_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          if (state.userCredential.user != null &&
              state.userCredential.user!.emailVerified) {
            SharedPreferences prefs = getIt<SharedPreferences>();
            await prefs.setString('password', passwordController.text.trim());
            GoRouter.of(context).pushReplacement(AppRouters.kHomeView);
          } else {
            try {
              await state.userCredential.user!.sendEmailVerification();
              showAwsomeDialog(
                message: 'Please verify your email',
                context: context,
                title: 'Email not verified',
                dialogType: DialogType.error,
                btnOkOnPress: () {},
              );
            } catch (e) {
              showAwsomeDialog(
                message: 'Something went wrong to verify your email',
                context: context,
                title: 'Error',
                dialogType: DialogType.error,
                btnOkOnPress: () {},
              );
            }
          }
        } else if (state is LoginFailure) {
          showAwsomeDialog(
            message: state.errorMessage,
            context: context,
            title: 'Error',
            dialogType: DialogType.error,
            btnOkOnPress: () {},
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Form(
              autovalidateMode: autovalidateMode,
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const LogoWidget(),
                    const LoginTitle(),
                    const SizedBox(
                      height: 20,
                    ),
                    EmailField(
                      emailController: emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordField(
                      passwordController: passwordController,
                      isPasswordVisible: isPasswordVisible,
                      togglePasswordVisibility: () {
                        setState(
                          () {
                            isPasswordVisible = !isPasswordVisible;
                          },
                        );
                      },
                    ),
                    ForgetPasswordWidget(
                      onPressed: () {
                        GoRouter.of(context)
                            .push(AppRouters.kForgetPasswordView);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    state is LoginLoading
                        ? const CustomLoadingIndecator()
                        : LoginButton(
                            text: 'Login',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                if (!emailController.text.contains('@')) {
                                  showSnackBar(context,
                                      message: 'Please enter a valid email',
                                      color: Colors.red);
                                } else {
                                  BlocProvider.of<LoginCubit>(context)
                                      .loginUser(
                                          email: emailController.text,
                                          password: passwordController.text);
                                }
                              } else {
                                setState(
                                  () {
                                    autovalidateMode = AutovalidateMode.always;
                                  },
                                );
                              }
                            },
                          ),
                    const SizedBox(
                      height: 30,
                    ),
                    RegisterRow(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
