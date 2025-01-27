import 'package:ai_assistant/apis/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/message.dart';

class ChatController extends GetxController {
  final textC = TextEditingController();
  final scrollC = ScrollController();
  final list = <Message>[
    Message(
        msg: "Hello, How can I assists you today?", msgType: MessageType.bot)
  ].obs;

  Future<void> askQuestion() async {
    if (textC.text.trim().isNotEmpty) {
      //user input
      list.add(Message(msg: textC.text, msgType: MessageType.user));
      list.add(Message(msg: 'Analysing Answer...', msgType: MessageType.bot));
      _scrollDown();
      final res = await APIs.getAnswer(textC.text);

      //Bot AI response
      list.removeLast();
      list.add(Message(msg: res, msgType: MessageType.bot));
      _scrollDown();
      textC.text = '';
    }
  }

  void _scrollDown() {
    scrollC.animateTo(scrollC.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
