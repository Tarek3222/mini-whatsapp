import 'package:clone_chat/core/constants/strings_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessegesServices {
  final CollectionReference messeges =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  Stream<QuerySnapshot> getAllMesseges() {
    return messeges.snapshots();
  }
}
