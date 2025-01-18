class GroupChatModel {
  String? id;
  String? name;
  String? image;
  String? description;
  String? adminId;
  String? createdAt;
  String? lastMessage;
  String? lastMessageTime;
  String? lastUserSentMessage;
  String? lastUserId;
  GroupChatModel({
    this.id,
    this.name,
    this.image,
    this.description,
    this.adminId,
    this.createdAt,
    this.lastMessage,
    this.lastMessageTime,
    this.lastUserSentMessage,
    this.lastUserId,
  });

  GroupChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    name = json['name'] as String?;
    image = json['image'] as String?;
    description = json['description'] as String?;
    adminId = json['adminId'] as String?;
    createdAt = json['createdAt'] as String?;
    lastMessage = json['lastMessage'] as String?;
    lastMessageTime = json['lastMessageTime'] as String?;
    lastUserSentMessage = json['lastUserSentMessage'] as String?;
    lastUserId = json['lastUserId'] as String?;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'description': description,
        'adminId': adminId,
        'createdAt': createdAt,
        'lastMessage': lastMessage,
        'lastMessageTime': lastMessageTime,
        'lastUserSentMessage': lastUserSentMessage,
        'lastUserId': lastUserId,
      };
}
