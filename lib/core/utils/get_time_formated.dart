import 'package:flutter/material.dart';

String getReadAndSentTimeFormated(
    {required BuildContext context, required String time}) {
  final DateTime sent = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
  final DateTime now = DateTime.now();
  if (sent.year == now.year && sent.month == now.month && sent.day == now.day) {
    return TimeOfDay.fromDateTime(sent).format(context);
  } else if (now.difference(sent).inDays == 1) {
    return 'Yesterday\n${TimeOfDay.fromDateTime(sent).format(context)}';
  } else {
    return '${sent.day}/${sent.month}/${sent.year}\n${TimeOfDay.fromDateTime(sent).format(context)}';
  }
}

String getLastMessageTime(
    {required BuildContext context, required String time}) {
  final DateTime sent = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
  final DateTime now = DateTime.now();
  if (sent.year == now.year && sent.month == now.month && sent.day == now.day) {
    return TimeOfDay.fromDateTime(sent).format(context);
  } else if (now.difference(sent).inDays == 1) {
    return 'Yesterday';
  } else {
    return '${sent.day}/${sent.month}/${sent.year}';
  }
}

String getLastActiveTime(
    {required BuildContext context, required String lastActive}) {
  int active = int.tryParse(lastActive) ?? -1;
  if (active == -1) return 'Last seen not available';
  final DateTime time = DateTime.fromMillisecondsSinceEpoch(active);
  final DateTime now = DateTime.now();

  String formattedTime = TimeOfDay.fromDateTime(time).format(context);
  if (time.year == now.year && time.month == now.month && time.day == now.day) {
    return 'Last seen today at $formattedTime';
  }
  if (now.difference(time).inDays == 1) {
    return 'Last seen yesterday at $formattedTime';
  }
  return 'Last seen on ${time.day}/${time.month}/${time.year}';
}
