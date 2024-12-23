class GroupChatModel {
  String? id;
  String? name;
  String? image;
  String? description;
  String? adminId;
  DateTime? createdAt;

  GroupChatModel({
    this.id,
    this.name,
    this.image,
    this.description,
    this.adminId,
    this.createdAt,
  });

  GroupChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    name = json['name'] as String?;
    image = json['image'] as String?;
    description = json['description'] as String?;
    adminId = json['adminId'] as String?;
    createdAt = json['createdAt'] as DateTime?;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'description': description,
        'adminId': adminId,
        'createdAt': createdAt,
      };
}
