class GroupMessageModel {
  String? fromId;
  String? message;
  DateTime? date;
  String? type;
  String? nameUser;
  String? imageUser;
  GroupMessageModel(
      {this.fromId,
      this.message,
      this.date,
      this.type,
      this.nameUser,
      this.imageUser});

  GroupMessageModel.fromJson(Map<String, dynamic> json) {
    fromId = json['fromId'] as String?;
    message = json['message'] as String?;
    date = json['date'] as DateTime?;
    type = json['type'] as String?;
    nameUser = json['nameUser'] as String?;
    imageUser = json['imageUser'] as String?;
  }

  Map<String, dynamic> toJson() => {
        'fromId': fromId,
        'message': message,
        'date': date,
        'type': type,
        'nameUser': nameUser,
        'imageUser': imageUser,
      };
}
