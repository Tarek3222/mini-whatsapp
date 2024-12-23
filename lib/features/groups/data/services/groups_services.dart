import 'package:cloud_firestore/cloud_firestore.dart';

class GroupsServices {
  CollectionReference groupsCollection =
      FirebaseFirestore.instance.collection('groups');
}
