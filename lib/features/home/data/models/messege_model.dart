class MessegeModel {
  String? fromId;
  String? toId;
  String? message;
  String? read;
  Type? type;
  String? sent;

  MessegeModel(
      {this.fromId, this.toId, this.message, this.read, this.type, this.sent});

  factory MessegeModel.fromJson(Map<String, dynamic> json) => MessegeModel(
        fromId: json['fromId'] ?? '',
        toId: json['toId'] ?? '',
        message: json['message'] ?? '',
        read: json['read'] ?? '',
        type: json['type'] == Type.image.name ? Type.image : Type.text,
        sent: json['sent'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'fromId': fromId,
        'toId': toId,
        'message': message,
        'read': read,
        'type': type?.name,
        'sent': sent,
      };
}

enum Type { text, image }
