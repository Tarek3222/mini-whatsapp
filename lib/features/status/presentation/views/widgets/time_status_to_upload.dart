import 'package:clone_chat/core/utils/get_time_formated.dart';
import 'package:flutter/material.dart';

class TimeStatusToUpload extends StatelessWidget {
  const TimeStatusToUpload({super.key, required this.stories});
  final List stories;

  @override
  Widget build(BuildContext context) {
    return Text(
      getTimeStoryFormated(context: context, time: stories.last['time']),
      style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
