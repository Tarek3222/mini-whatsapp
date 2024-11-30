import 'package:clone_chat/core/errors/auth_failure.dart';
import 'package:clone_chat/core/models/user_model.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyRepo {
  AuthServices authServices;

  MyRepo({required this.authServices});
  Future<Either<AuthFailure, UserCredential>> registerUser(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    try {
      await UserServices().addUser(
          user: UserModel(
        name: name,
        phone: phone,
        email: email,
      ));
      var userCred =
          await authServices.register(email: email, password: password);
      return Right(userCred);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return Left(AuthFailure('Email already in use'));
      } else if (e.code == 'invalid-email') {
        return Left(AuthFailure('Invalid email'));
      } else if (e.code == 'weak-password') {
        return Left(AuthFailure('Weak password'));
      } else {
        return Left(AuthFailure('Something went wrong'));
      }
    } catch (e) {
      return Left(AuthFailure('Something went wrong'));
    }
  }

  Future<Either<AuthFailure, UserCredential>> loginUser(
      {required String email, required String password}) async {
    try {
      return Right(await authServices.login(email: email, password: password));
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.code));
    } catch (e) {
      return Left(AuthFailure('Something went wrong'));
    }
  }
}
