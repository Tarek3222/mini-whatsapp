class MessageAiModel {
  final bool isUser;
  final String message;
  final DateTime date;
  final String type;
  final bool isTyping;

  MessageAiModel({
    required this.isUser,
    required this.message,
    required this.date,
    required this.type,
    required this.isTyping,
  });

  factory MessageAiModel.fromJson(Map<String, dynamic> json) => MessageAiModel(
        isUser: json['isUser'],
        message: json['message'],
        date: DateTime.parse(json['date']),
        type: json['type'],
        isTyping: json['isTyping'],
      );

  Map<String, dynamic> toJson() => {
        'isUser': isUser,
        'message': message,
        'date': date.toIso8601String(),
        'type': type,
        'isTyping': isTyping,
      };
}
