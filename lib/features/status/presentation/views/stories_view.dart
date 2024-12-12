import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoriesView extends StatefulWidget {
  const StoriesView({super.key, required this.stories});
  final List stories;

  @override
  State<StoriesView> createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView> {
  StoryController controller = StoryController();
  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: widget.stories.map((story) {
        if (story['type'] == 'image') {
          return StoryItem.pageImage(
            url: story['content'],
            controller: controller,
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
