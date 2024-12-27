import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/widgets/custom_loading_indecator.dart';
import 'package:clone_chat/features/chat_with_ai/data/models/message_model.dart';
import 'package:clone_chat/features/chat_with_ai/data/services/chat_ai_services.dart';
import 'package:clone_chat/features/chat_with_ai/presentation/views/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatAiBody extends StatelessWidget {
  const ChatAiBody({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getIt.get<ChatAiServices>().getMessages(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageAiModel> messages = snapshot.data!.docs
              .map(
                (e) =>
                    MessageAiModel.fromJson(e.data() as Map<String, dynamic>),
              )
              .toList();
          if (messages.isNotEmpty) {
            bool isTyping = messages[0].isTyping;
            return ListView.builder(
              controller: scrollController,
              reverse: true,
              itemCount: messages.length +
                  1, // Adjust item count to add typing indicator
              itemBuilder: (context, index) {
                if (index == 0) {
                  // Show typing indicator at the bottom
                  return isTyping
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Gemini is typing...",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(); // If not typing, show nothing
                }
                return messages[index - 1].isUser
                    ? ChatWidgetBubble(
                        msg: messages[index - 1].message,
                        date: messages[index - 1].date,
                      )
                    : ChatWidgetBubblefriend(
                        date: messages[index - 1].date,
                        msg: messages[index - 1].message,
                      );
              },
            );
          } else {
            return Center(
              child: Text(
                'start chat with Gemini 😘',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            );
          }
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          );
        } else {
          return CustomLoadingIndecator();
        }
      },
    );
  }
}
