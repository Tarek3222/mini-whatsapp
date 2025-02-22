import 'package:clone_chat/core/constants/strings_constants.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> login(
      {required String email, required String password}) async {
    return await auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> register(
      {required String email, required String password}) async {
    return await auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  Future<void> verifyEmail() async {
    await auth.currentUser!.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    return auth.currentUser!.emailVerified;
  }

  Future<void> deleteAccount() async {
    await auth.currentUser!.delete();
    await getIt.get<UserServices>().deleteUser(
          uid: auth.currentUser!.uid,
        );
  }

  Future<void> updateEmail({required String email}) async {
    await auth.currentUser!.verifyBeforeUpdateEmail(email);
  }

  Future<void> updatePassword({required String password}) async {
    await auth.currentUser!.updatePassword(password);
  }

  Future<bool> userExists({required String email}) async {
    final data = await getIt
        .get<UserServices>()
        .users
        .where(kEmailUser, isEqualTo: email)
        .get();
    return data.docs.isNotEmpty;
  }
}
