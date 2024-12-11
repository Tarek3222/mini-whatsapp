import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoriesView extends StatefulWidget {
  const StoriesView({super.key});

  @override
  State<StoriesView> createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView> {
  StoryController controller = StoryController();
  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: [
        StoryItem.pageImage(
          url: "https://picsum.photos/200/300",
          controller: controller,
        ),
        StoryItem.text(
          title: 'Story 2',
          backgroundColor: Colors.green,
        ),
        StoryItem.text(
          title: 'Story 3',
          backgroundColor: Colors.blue,
        ),
      ],
      controller: controller,
      repeat: true,
      onVerticalSwipeComplete: (direction) {
        if (direction == Direction.down) {
          Navigator.pop(context);
        }
      },
      onComplete: () {},
    );
  }
}
