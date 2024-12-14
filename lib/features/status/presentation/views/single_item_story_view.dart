import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class SingleItemStoryView extends StatefulWidget {
  const SingleItemStoryView({super.key, required this.story});
  final Map<String, dynamic> story;

  @override
  State<SingleItemStoryView> createState() => _SingleItemStoryView();
}

class _SingleItemStoryView extends State<SingleItemStoryView> {
  StoryController controller = StoryController();
  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: [
        widget.story['type'] == 'image'
            ? StoryItem.pageImage(
                url: widget.story['content'],
                controller: controller,
              )
            : StoryItem.pageVideo(
                widget.story['content'],
                controller: controller,
              )
      ],
      controller: controller,
      repeat: true,
      onVerticalSwipeComplete: (direction) {
        if (direction == Direction.down) {
          Navigator.pop(context);
        }
      },
      onComplete: () {
        Navigator.pop(context);
      },
    );
  }
}
