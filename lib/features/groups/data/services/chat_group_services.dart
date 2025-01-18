// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:clone_chat/features/groups/data/models/group_message_model.dart';
import 'package:clone_chat/features/groups/data/services/groups_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class ChatGroupServices {
  Future<void> sendMessage(
      {required String msg,
      required String groupId,
      required String type}) async {
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    User? user = getIt<AuthServices>().auth.currentUser;
    GroupMessageModel message = GroupMessageModel(
      fromId: user!.uid,
      message: msg,
      date: time,
      type: type,
      nameUser: user.displayName,
      imageUser: user.photoURL,
    );
    await getIt.get<GroupsServices>().updateLastMessage(
          groupId: groupId,
          msg: type == 'text' ? msg : 'image',
          lastUserSentMessage: user.displayName!,
          lastUserId: user.uid,
        );
    return await getIt
        .get<GroupsServices>()
        .groupsCollection
        .doc(groupId)
        .collection("chat_group")
        .doc(time)
        .set(
          message.toJson(),
        );
  }

  Stream<QuerySnapshot> getMessages({required String groupId}) {
    return getIt
        .get<GroupsServices>()
        .groupsCollection
        .doc(groupId)
        .collection("chat_group")
        .orderBy("date", descending: true)
        .snapshots();
  }

  Future<void> sendImage({required File file, required String groupId}) async {
    String fileName = basename(file.path);
    var refStorage =
        FirebaseStorage.instance.ref('groupChatsImgs/$groupId/$fileName');
    await refStorage.putFile(file);
    String imageUrl = await refStorage.getDownloadURL();
    return await sendMessage(msg: imageUrl, groupId: groupId, type: 'image');
  }
}
