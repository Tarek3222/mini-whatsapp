import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class SingleStoriesView extends StatefulWidget {
  const SingleStoriesView({super.key, required this.storie});
  final Map<String, dynamic> storie;

  @override
  State<SingleStoriesView> createState() => _SingleStoriesViewState();
}

class _SingleStoriesViewState extends State<SingleStoriesView> {
  StoryController controller = StoryController();
  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: [
        widget.storie['type'] == 'image'
            ? StoryItem.pageImage(
                url: widget.storie['content'],
                controller: controller,
              )
            : StoryItem.pageVideo(
                widget.storie['content'],
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
