// ignore_for_file: use_build_context_synchronously, body_might_complete_normally_nullable

import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:clone_chat/core/constants/strings_constants.dart';
import 'package:clone_chat/core/models/user_model.dart';
import 'package:clone_chat/core/widgets/show_awsome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserServices {
  CollectionReference users =
      FirebaseFirestore.instance.collection(kAllUsersCollection);

  Future<String?> addUser({required UserModel user}) async {
    try {
      var docRef = await users.add({
        kNameUser: user.name,
        kPhoneUser: user.phone,
        kEmailUser: user.email,
        kImageUser: '',
        kUidUser: '',
      });
      log('user added');
      return docRef.id;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateUser({
    required UserModel user,
  }) {
    return users.doc(user.uid).update(
        {kNameUser: user.name, kPhoneUser: user.phone, kImageUser: user.image});
  }

  Future<void> deleteUser(
      {required String uid, required BuildContext context}) {
    return users
        .doc(uid)
        .delete()
        .then((value) => showAwsomeDialog(
            message: 'User deleted successfully',
            context: context,
            title: 'Success',
            dialogType: DialogType.success))
        .catchError((error) => showAwsomeDialog(
            message: 'Something went wrong $error',
            context: context,
            title: 'Error',
            dialogType: DialogType.error));
  }

  Stream<DocumentSnapshot> getUser(String uid) {
    return users.doc(uid).snapshots();
  }

  Stream<QuerySnapshot> getAllUsers() {
    return users.snapshots();
  }
}
