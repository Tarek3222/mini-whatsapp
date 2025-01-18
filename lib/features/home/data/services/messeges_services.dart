// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:clone_chat/features/home/data/models/messege_model.dart';
import 'package:clone_chat/features/home/data/services/notifications_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class MessegesServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAllMesseges(ChatUser user) {
    return firestore
        .collection(
            'chats/${MessegesServices.getConversationId(user.uid!)}/messeges/')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  Future<void> deleteMessege(MessegeModel messege, ChatUser user) async {
    await firestore
        .collection(
            'chats/${MessegesServices.getConversationId(user.uid!)}/messeges/')
        .doc(messege.sent)
        .delete();
    if (messege.type == Type.image) {
      await FirebaseStorage.instance.refFromURL(messege.message!).delete();
    }
  }

// For Messeges To detect the conversation id
  static String getConversationId(String id) {
    return AuthServices().auth.currentUser!.uid.hashCode <= id.hashCode
        ? '${AuthServices().auth.currentUser!.uid}_$id'
        : '${id}_${AuthServices().auth.currentUser!.uid}';
  }

  // for adding an user to my users when first message is sent
  Future<void> sendFirstMessage(
    ChatUser user,
    String msg,
    Type type,
  ) async {
    await getIt
        .get<UserServices>()
        .users
        .doc(user.uid)
        .collection("my_users")
        .doc(AuthServices().auth.currentUser!.uid)
        .set({}).then((value) {
      sendMessage(
        user,
        msg,
        type,
      );
    });
  }

  Future<void> sendMessage(
    ChatUser user,
    String msg,
    Type type,
  ) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final MessegeModel messege = MessegeModel(
      fromId: getIt.get<AuthServices>().auth.currentUser!.uid,
      message: msg,
      sent: time,
      read: '',
      type: type,
      createdAt: DateTime.now(),
      toId: user.uid,
    );
    var currentUser = await getIt.get<UserServices>().getCurrentUser().first;
    ChatUser myUser =
        ChatUser.fromJson(currentUser.data()! as Map<String, dynamic>);
    bool isNotifyEnalbled = myUser.enabledNotify!;
    if (isNotifyEnalbled) {
      await getIt.get<NotificationsServices>().sendNotifications(
            fcmToken: user.pushToken!,
            name: getIt.get<AuthServices>().auth.currentUser!.displayName!,
            message: msg,
            userId: getIt.get<AuthServices>().auth.currentUser!.uid,
            type: type.name,
          );
    }
    await getIt
        .get<UserServices>()
        .updateLastMessageTime(time: time, uid: user.uid!);
    return await firestore
        .collection(
            'chats/${MessegesServices.getConversationId(user.uid!)}/messeges/') //collection(chats).doc(conversationId).collection(messeges)
        .doc(time)
        .set(messege.toJson());
  }

  Future<void> updateMessegeReadStatus(MessegeModel messege) async {
    return await firestore
        .collection(
            'chats/${MessegesServices.getConversationId(messege.fromId!)}/messeges/')
        .doc(messege.sent)
        .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});
  }

  Future<void> updateMessage(MessegeModel messege) async {
    return await firestore
        .collection(
            'chats/${MessegesServices.getConversationId(messege.toId!)}/messeges/')
        .doc(messege.sent)
        .update({'message': messege.message});
  }

  Stream<QuerySnapshot> getLastMessege(ChatUser user) {
    return firestore
        .collection(
            'chats/${MessegesServices.getConversationId(user.uid!)}/messeges/')
        .orderBy('createdAt', descending: true)
        .limit(1)
        .snapshots();
  }

  Stream<QuerySnapshot> getUnreadMesseges(ChatUser user) {
    return firestore
        .collection(
            'chats/${MessegesServices.getConversationId(user.uid!)}/messeges/')
        .where('fromId', isNotEqualTo: AuthServices().auth.currentUser!.uid)
        .where('read', isEqualTo: '')
        .snapshots();
  }

  Future<void> sendImage(ChatUser user, File file) async {
    // to upload the image to firebase
    String fileName = basename(file.path);
    var refStorage = FirebaseStorage.instance.ref(
        'chatsImages/${MessegesServices.getConversationId(user.uid!)}/$fileName'); // create ref for storage and the name is all_images (folrder)
    await refStorage.putFile(file);
    String imageUrl = await refStorage.getDownloadURL();
    return await sendMessage(
      user,
      imageUrl,
      Type.image,
    );
  }
}
