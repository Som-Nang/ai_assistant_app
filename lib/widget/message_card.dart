import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/model/message.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../helper/global.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular(15);
    return message.msgType == MessageType.bot
        //Bot Chat
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
                SizedBox(width: 6),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/ai_logo.png',
                    width: 28,
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: mq.width * .8),
                  margin: EdgeInsets.only(
                      bottom: mq.height * .02, left: mq.width * .02),
                  padding: EdgeInsets.symmetric(
                    vertical: mq.height * .01,
                    horizontal: mq.width * .02,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Theme.of(context).lightTextColor),
                      borderRadius: BorderRadius.only(
                          topLeft: r, topRight: r, bottomRight: r)),
                  // child: Text(
                  //   message.msg,
                  //   textAlign: TextAlign.start,
                  // ),
                  child: message.msg != 'Analysing Answer...'
                      ? AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              message.msg,
                              speed: const Duration(milliseconds: 50),
                            ),
                          ],
                          totalRepeatCount: 1,
                        )
                      : Text(
                          message.msg,
                          textAlign: TextAlign.start,
                        ),
                )
              ])

        //User or Human Chat
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
                Container(
                  constraints: BoxConstraints(maxWidth: mq.width * .8),
                  margin: EdgeInsets.only(
                      bottom: mq.height * .02, right: mq.width * .02),
                  padding: EdgeInsets.symmetric(
                    vertical: mq.height * .01,
                    horizontal: mq.width * .02,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Theme.of(context).lightTextColor),
                      borderRadius: BorderRadius.only(
                          topLeft: r, topRight: r, bottomLeft: r)),
                  child: Text(
                    message.msg,
                    textAlign: TextAlign.end,
                  ),
                ),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.yellow,
                  child: Image.asset(
                    'assets/images/human.png',
                    width: 32,
                  ),
                ),
                SizedBox(width: 6),
              ]);
  }
}
