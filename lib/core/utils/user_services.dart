// ignore_for_file: use_build_context_synchronously, body_might_complete_normally_nullable

import 'dart:developer';
import 'package:clone_chat/core/constants/strings_constants.dart';
import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserServices {
  CollectionReference users =
      FirebaseFirestore.instance.collection(kAllUsersCollection);

  Future<void> addUser({required ChatUser user, required String uid}) async {
    return await users
        .doc(uid)
        .set(user.toJson())
        .then(
          (value) => log('User Added'),
        )
        .catchError((error) => log('Failed to add user: $error'));
  }

  Future<void> updateUser({
    required ChatUser user,
  }) {
    return users.doc(user.uid).update(
        {kNameUser: user.name, kPhoneUser: user.phone, kImageUser: user.image});
  }

  Future<void> deleteUser(
      {required String uid, required BuildContext context}) {
    return users.doc(uid).delete();
  }

  Stream<DocumentSnapshot> getCurrentUser() {
    return users
        .doc(getIt.get<AuthServices>().auth.currentUser!.uid)
        .snapshots();
  }

  Stream<QuerySnapshot> getAllUsers() {
    return users
        .where(kUidUser,
            isNotEqualTo: getIt.get<AuthServices>().auth.currentUser!.uid)
        .snapshots();
  }
}
