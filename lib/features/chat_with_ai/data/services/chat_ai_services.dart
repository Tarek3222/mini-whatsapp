import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:clone_chat/features/chat_with_ai/data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatAiServices {
  CollectionReference chatsWithAiCollection =
      FirebaseFirestore.instance.collection('chatsWithAi');

  Future<void> sendMessage({required MessageAiModel message}) async {
    await chatsWithAiCollection
        .doc(
          getIt.get<AuthServices>().auth.currentUser!.uid,
        )
        .collection("messages")
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(message.toJson());
  }

  Stream<QuerySnapshot> getMessages() {
    return chatsWithAiCollection
        .doc(getIt.get<AuthServices>().auth.currentUser!.uid)
        .collection("messages")
        .orderBy("date", descending: true)
        .snapshots();
  }
}
