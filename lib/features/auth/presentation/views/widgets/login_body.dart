import 'package:clone_chat/core/constants/app_routers.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/email_field.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/login_button.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/login_title.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/password_field.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/register_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Form(
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
                const SizedBox(
                  height: 20,
                ),
                LoginButton(
                  emailController: emailController,
                  passwordController: passwordController,
                  onSuccess: () {
                    GoRouter.of(context).push(AppRouters.kHomeView);
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
  }
}
