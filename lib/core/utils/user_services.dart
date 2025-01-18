// ignore_for_file: use_build_context_synchronously, body_might_complete_normally_nullable, depend_on_referenced_packages

import 'dart:developer';
import 'dart:io';
import 'package:clone_chat/core/constants/strings_constants.dart';
import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

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
    return users.doc(user.uid).update({
      kNameUser: user.name,
      kPhoneUser: user.phone,
      kImageUser: user.image,
      kAboutUser: user.about,
    });
  }

  Future<void> deleteUser({
    required String uid,
  }) {
    return users.doc(uid).delete();
  }

  Stream<DocumentSnapshot> getCurrentUser() {
    return users
        .doc(getIt.get<AuthServices>().auth.currentUser!.uid)
        .snapshots();
  }

  Stream<QuerySnapshot> getAllUsers({required List<String> usersId}) {
    return users
        .orderBy(kLastMessageTime, descending: true)
        .where(kUidUser, whereIn: usersId.isEmpty ? [''] : usersId)
        .snapshots();
  }

  Future<void> updateLastMessageTime(
      {required String time, required String uid}) async {
    await users
        .doc(getIt.get<AuthServices>().auth.currentUser!.uid)
        .update({kLastMessageTime: time});

    await users.doc(uid).update({kLastMessageTime: time});
  }

  Stream<DocumentSnapshot> getUserInfo(ChatUser user) {
    return users.doc(user.uid).snapshots();
  }

  Future<void> updateActiveStatus({required bool isOnline}) async {
    return await users
        .doc(getIt.get<AuthServices>().auth.currentUser!.uid)
        .update(
      {
        kIsOnline: isOnline,
        kLastActive: DateTime.now().millisecondsSinceEpoch.toString(),
      },
    );
  }

  Future<void> updatePushToken({required String token}) async {
    return await users
        .doc(getIt.get<AuthServices>().auth.currentUser!.uid)
        .update(
      {
        kPushToken: token,
      },
    );
  }

  Future<void> updateEnableNotification({required bool isEnabled}) async {
    return await users
        .doc(getIt.get<AuthServices>().auth.currentUser!.uid)
        .update(
      {
        'enabledNotify': isEnabled,
      },
    );
  }

  //for Adding new chat User
  Future<bool> addNewChatUser({required String email}) async {
    final data = await users.where(kEmailUser, isEqualTo: email).get();
    if (data.docs.isNotEmpty &&
        data.docs.first.id != getIt.get<AuthServices>().auth.currentUser!.uid) {
      //user exists
      users
          .doc(getIt.get<AuthServices>().auth.currentUser!.uid)
          .collection("my_users")
          .doc(data.docs.first.id)
          .set({});
      return true;
    } else {
      //user not exists
      return false;
    }
  }

  Stream<QuerySnapshot> getMyUsers() {
    return users
        .doc(getIt.get<AuthServices>().auth.currentUser!.uid)
        .collection("my_users")
        .snapshots();
  }

  Stream<QuerySnapshot> getAllMyUsersStories({required List<String> usersId}) {
    return users
        .where(kUidUser, whereIn: usersId.isEmpty ? [''] : usersId)
        .where('stories', isNotEqualTo: []).snapshots();
  }

  Stream<DocumentSnapshot> getCurrentUserStories() {
    return users
        .doc(getIt.get<AuthServices>().auth.currentUser!.uid)
        .snapshots();
  }

  Future<void> deleteStory({required Map<String, dynamic> story}) async {
    final refStorage = FirebaseStorage.instance.refFromURL(story['content']);
    await refStorage.delete().catchError((e) {});
    return await users.doc(story['uid']).update({
      'stories': FieldValue.arrayRemove([story])
    });
  }

  Future<void> addStory({required String storyType, required File file}) async {
    String fileName = basename(file.path);
    var refStorage = FirebaseStorage.instance.ref(
        'stories/${getIt.get<AuthServices>().auth.currentUser!.uid}/$fileName'); // create ref for storage and the name is all_images (folrder)
    await refStorage.putFile(file);
    String contentUrl = await refStorage.getDownloadURL();
    return await users.doc(getIt.get<AuthServices>().auth.currentUser!.uid).set(
      {
        'stories': FieldValue.arrayUnion(
          [
            {
              'uid': getIt.get<AuthServices>().auth.currentUser!.uid,
              'storyId': DateTime.now().millisecondsSinceEpoch.toString(),
              'content': contentUrl,
              'type': storyType,
              'time': DateTime.now().millisecondsSinceEpoch.toString(),
              'Viewers': [],
            }
          ],
        ),
      },
      SetOptions(merge: true),
    );
  }

  // for delete story after 24 hours
  Future<void> deleteStoryAfter24Hours(
      {required Map<String, dynamic> story}) async {
    final DateTime uploadTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(story['time']));
    final DateTime now = DateTime.now();
    if (now.difference(uploadTime).inHours > 24) {
      return await deleteStory(story: story).catchError((e) {});
    }
  }

  // update number of viewers
  Future<void> updateStoryViewers(
      {required List stories, required String uid}) async {
    return await users.doc(uid).update(
      {
        'stories': stories,
      },
    );
  }
}
