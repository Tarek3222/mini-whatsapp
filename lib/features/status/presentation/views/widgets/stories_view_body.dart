import 'package:clone_chat/core/models/chat_user.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoriesViewBody extends StatefulWidget {
  const StoriesViewBody({super.key, required this.stories, required this.user});
  final List stories;
  final ChatUser user;

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
            shown: story['Viewers']
                .contains(getIt.get<AuthServices>().auth.currentUser!.uid),
            duration: const Duration(seconds: 7),
          );
        } else {
          return StoryItem.pageVideo(
            story['content'],
            controller: controller,
            shown: story['Viewers']
                .contains(getIt.get<AuthServices>().auth.currentUser!.uid),
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
      onStoryShow: (storyItem, index) async {
        if (widget.stories[index]['uid'] !=
            getIt.get<AuthServices>().auth.currentUser!.uid) {
          Map<String, dynamic> story = widget.stories[index];
          List viewers = story['Viewers'] ?? [];
          String currentUserId =
              getIt.get<AuthServices>().auth.currentUser!.uid;
          if (!viewers.contains(currentUserId)) {
            viewers.add(currentUserId);
            story['Viewers'] = viewers;
            // Replace the story in the array
            widget.stories[index] = story;
            // Update the entire stories array in Firestore
            await getIt.get<UserServices>().updateStoryViewers(
                stories: widget.stories, uid: widget.user.uid!);
          }
        }
      },
    );
  }
}
