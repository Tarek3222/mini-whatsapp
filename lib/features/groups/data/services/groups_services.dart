// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:clone_chat/core/constants/strings_constants.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:clone_chat/features/groups/data/models/group_chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class GroupsServices {
  CollectionReference groupsCollection =
      FirebaseFirestore.instance.collection('groups');

  Future<void> createGroup({
    required String nameGroup,
    required String descGroup,
    File? file,
  }) async {
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    String imageUrl = '';
    if (file != null) {
      String fileName = basename(file.path);
      var refStorage = FirebaseStorage.instance.ref('groupsImages/$fileName');
      await refStorage.putFile(file);
      imageUrl = await refStorage.getDownloadURL();
    }
    GroupChatModel groupChatModel = GroupChatModel(
      id: time,
      name: nameGroup,
      description: descGroup,
      createdAt: time,
      adminId: getIt.get<AuthServices>().auth.currentUser!.uid,
      image: file != null ? imageUrl : kImageGroupDefault,
      lastMessage: '',
      lastMessageTime: '',
    );

    return await groupsCollection.doc(time).set(groupChatModel.toJson());
  }

  Stream<QuerySnapshot> getAllGroups() {
    return groupsCollection.snapshots();
  }

  Future<void> updateLastMessage({
    required String groupId,
    required String msg,
    required String lastUserSentMessage,
    required String lastUserId,
  }) async {
    return await groupsCollection.doc(groupId).update(
      {
        'lastMessage': msg,
        'lastMessageTime': DateTime.now().millisecondsSinceEpoch.toString(),
        'lastUserSentMessage': lastUserSentMessage,
        'lastUserId': lastUserId,
      },
    );
  }
}
