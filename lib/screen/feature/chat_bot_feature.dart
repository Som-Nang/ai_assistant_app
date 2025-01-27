import 'package:ai_assistant/controller/chat_controller.dart';
import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/widget/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';

class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
  //final _c = Get.put(ChatController());

  final _c = ChatController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat With AI Assistant"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              controller: _c.textC,
              textAlign: TextAlign.start,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  isDense: true,
                  hintText: 'Ask me anything you want...',
                  hintStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)))),
            )),
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).buttonColor,
              child: IconButton(
                onPressed: _c.askQuestion,
                icon: Icon(
                  Icons.rocket_launch_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            )
          ],
        ),
      ),
      body: Obx(() => ListView(
            physics: const BouncingScrollPhysics(),
            controller: _c.scrollC,
            padding:
                EdgeInsets.only(top: mq.height * .02, bottom: mq.width * .02),
            children: _c.list
                .map((e) => MessageCard(
                      message: e,
                    ))
                .toList(),
          )),
    );
  }
}
