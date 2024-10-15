import 'package:clone_chat/core/function/show_snack_bar.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/email_field.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/login_row.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/name_field.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/password_field.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/phone_field.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/sign_up_button.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/sign_up_title.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool isPasswordVisible = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                const SignUpTitle(),
                const SizedBox(
                  height: 20,
                ),
                NameField(
                  nameController: nameController,
                ),
                const SizedBox(
                  height: 15,
                ),
                EmailField(
                  emailController: emailController,
                ),
                const SizedBox(
                  height: 15,
                ),
                PhoneField(
                  phoneController: phoneController,
                ),
                const SizedBox(
                  height: 15,
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
                SignUpButton(
                  onSuccess: () {
                    if (formKey.currentState!.validate()) {
                      if (!emailController.text.contains('@')) {
                        showSnackBar(context,
                            message: 'Please enter a valid email');
                      } else if (phoneController.text.length < 11) {
                        showSnackBar(context,
                            message: 'Please enter a valid phone number');
                      } else if (passwordController.text.length < 8) {
                        showSnackBar(context,
                            message: 'Password must be at least 8 characters');
                      } else {
                        Navigator.pop(context);
                      }
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                LoginRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
