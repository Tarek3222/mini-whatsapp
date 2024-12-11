// ignore_for_file: use_build_context_synchronously, body_might_complete_normally_nullable
import 'package:clone_chat/core/constants/strings_constants.dart';
import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatUserServices {
  CollectionReference chats =
      FirebaseFirestore.instance.collection(kChatsCollection);

  Future<void> createChatUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final ChatUser chatUser = ChatUser(
      uid: getIt.get<AuthServices>().auth.currentUser!.uid,
      name: getIt.get<AuthServices>().auth.currentUser!.displayName!.toString(),
      email: getIt.get<AuthServices>().auth.currentUser!.email!.toString(),
      image: getIt.get<AuthServices>().auth.currentUser!.photoURL!.toString(),
      about: "Hey there, I'm using Clone Chat",
      pushToken: "",
      isOnline: false,
      isSeen: false,
      lastMessage: '',
      lastMessageTime: '',
      createdAt: time,
      lastActive: time,
    );
    return await chats
        .doc(getIt.get<AuthServices>().auth.currentUser!.uid)
        .set(chatUser.toJson());
  }

  Future<bool> userExists() async {
    return (await chats
            .doc(getIt.get<AuthServices>().auth.currentUser!.uid)
            .get())
        .exists;
  }

  Stream<QuerySnapshot> getAllUsers() {
    return chats.snapshots();
  }
}
