import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoriesViewBody extends StatefulWidget {
  const StoriesViewBody({super.key, required this.stories});
  final List stories;

  @override
  State<StoriesViewBody> createState() => _StoriesViewStateBody();
}

class _StoriesViewStateBody extends State<StoriesViewBody> {
  StoryController controller = StoryController();
  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: widget.stories.map((story) {
        if (story['type'] == 'image') {
          return StoryItem.pageImage(
            url: story['content'],
            controller: controller,
            duration: const Duration(seconds: 7),
          );
        } else {
          return StoryItem.pageVideo(
            story['content'],
            controller: controller,
          );
        }
      }).toList(),
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
