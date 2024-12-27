import 'package:clone_chat/core/themes/app_colors.dart';
import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/features/chat_with_ai/data/models/message_model.dart';
import 'package:clone_chat/features/chat_with_ai/data/services/chat_ai_services.dart';
import 'package:clone_chat/features/chat_with_ai/presentation/views/widgets/chat_ai_body.dart';
import 'package:clone_chat/features/chat_with_ai/presentation/views/widgets/chat_ai_view_app_bar.dart';
import 'package:clone_chat/features/chat_with_ai/presentation/views/widgets/custom_text_feild_chat.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_generative_ai/google_generative_ai.dart';

class ChatAiView extends StatefulWidget {
  const ChatAiView({
    super.key,
  });

  @override
  State<ChatAiView> createState() => _UsersChatAiViewState();
}

class _UsersChatAiViewState extends State<ChatAiView> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  static const apiKey = "AIzaSyBySNh0VZ5oNRmQgJJ_y5WH5MkNQnzmlwo";
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  Future<void> sendMessage() async {
    // User starts typing
    String textSend = text!;
    setState(
      () {
        text = '';
      },
    );
    await getIt.get<ChatAiServices>().sendMessage(
          message: MessageAiModel(
            isUser: true,
            message: textSend,
            date: DateTime.now(),
            type: 'text',
            isTyping: true,
          ),
        );
    // Gemini starts typing
    final content = [Content.text(textSend)];
    final response = await model.generateContent(content);
    await getIt.get<ChatAiServices>().sendMessage(
          message: MessageAiModel(
            isUser: false,
            message: response.text ?? "",
            date: DateTime.now(),
            type: 'text',
            isTyping: false,
          ),
        );
  }

  String? text;

  @override
  void dispose() {
    textEditingController.dispose();
    _focusNode.dispose();
    _scrollController.dispose(); // Dispose of the scroll controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAiViewAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SafeArea(
              child: SizedBox(),
            ),
            Expanded(
              child: ChatAiBody(
                scrollController: _scrollController,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextFeildChat(
                      focusNode: _focusNode,
                      hintTitle: 'Send a chat message',
                      textEditingController: textEditingController,
                      onChanged: (value) {
                        setState(
                          () {
                            text = value;
                          },
                        );
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: text == null || text == ''
                        ? null
                        : () {
                            textEditingController.clear();
                            sendMessage();
                            if (_scrollController.hasClients) {
                              _scrollController.animateTo(
                                0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeOut,
                              );
                            }
                            _focusNode.unfocus();
                          },
                    icon: Icon(
                      FontAwesomeIcons.paperPlane,
                      color: text == null || text == ''
                          ? Colors.grey
                          : AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
