import 'package:clone_chat/core/function/show_snack_bar.dart';
import 'package:clone_chat/core/widgets/custom_loading_indecator.dart';
import 'package:clone_chat/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:clone_chat/features/auth/presentation/view_model/register_cubit/register_state.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/email_field.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/login_row.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/name_field.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/password_field.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/phone_field.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/sign_up_button.dart';
import 'package:clone_chat/features/auth/presentation/views/widgets/sign_up_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          if (state.userCredential.user != null) {
            state.userCredential.user!.sendEmailVerification();
            showSnackBar(context,
                message: 'Account created, please verify your email and login');
            Navigator.pop(context);
          }
        } else if (state is RegisterFailure) {
          showSnackBar(context, message: state.message, color: Colors.red);
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
                    state is RegisterLoading
                        ? const CustomLoadingIndecator()
                        : SignUpButton(
                            onSuccess: () {
                              if (formKey.currentState!.validate()) {
                                if (!emailController.text.contains('@')) {
                                  showSnackBar(context,
                                      message: 'Please enter a valid email',
                                      color: Colors.red);
                                } else if (phoneController.text.length < 11) {
                                  showSnackBar(context,
                                      message:
                                          'Please enter a valid phone number',
                                      color: Colors.red);
                                } else if (passwordController.text.length < 8) {
                                  showSnackBar(context,
                                      message:
                                          'Password must be at least 8 characters',
                                      color: Colors.red);
                                } else {
                                  BlocProvider.of<RegisterCubit>(context)
                                      .registerUser(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
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
      },
    );
  }
}
