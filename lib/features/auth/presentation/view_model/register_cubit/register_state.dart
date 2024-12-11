import 'package:firebase_auth/firebase_auth.dart';

class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String message;
  RegisterFailure(this.message);
}

class RegisterSuccess extends RegisterState {
  final UserCredential userCredential;
  RegisterSuccess(this.userCredential);
}
