import 'package:clone_chat/core/constants/strings_constants.dart';

class ChatUser {
  String? name;
  String? email;
  String? image;
  String? phone;
  String? uid;
  String? createdAt;
  String? lastActive;
  String? pushToken;
  bool? isOnline;
  String? lastMessage;
  String? lastMessageTime;
  String? about;
  bool? isSeen;

  ChatUser({
    this.name,
    this.email,
    this.image,
    this.about,
    this.uid,
    this.createdAt,
    this.lastActive,
    this.phone,
    this.pushToken,
    this.isOnline,
    this.lastMessage,
    this.lastMessageTime,
    this.isSeen,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      name: json[kNameUser] as String?,
      email: json[kEmailUser] as String?,
      image: json[kImageUser] as String?,
      phone: json[kPhoneUser] as String?,
      uid: json[kUidUser] as String?,
      createdAt: json[kCreatedAt] as String?,
      lastActive: json[kLastActive] as String?,
      pushToken: json[kPushToken] as String?,
      isOnline: json[kIsOnline] as bool?,
      lastMessage: json[kLastMessage] as String?,
      lastMessageTime: json[kLastMessageTime] as String?,
      isSeen: json[kIsSeen] as bool?,
      about: json[kAboutUser] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      kNameUser: name,
      kEmailUser: email,
      kImageUser: image,
      kUidUser: uid,
      kCreatedAt: createdAt,
      kLastActive: lastActive,
      kPushToken: pushToken,
      kIsOnline: isOnline,
      kLastMessage: lastMessage,
      kLastMessageTime: lastMessageTime,
      kIsSeen: isSeen,
      kAboutUser: about,
      kPhoneUser: phone,
    };
  }
}
