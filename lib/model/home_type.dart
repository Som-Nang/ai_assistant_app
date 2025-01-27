import 'package:ai_assistant/screen/feature/chat_bot_feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screen/feature/image_feature.dart';
import '../screen/feature/translator_feature.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType {
  String get title => switch (this) {
        HomeType.aiChatBot => 'Ai ChatBot',
        HomeType.aiImage => 'AI Image Creator',
        HomeType.aiTranslator => 'Language Translator'
      };

  String get image => switch (this) {
        HomeType.aiChatBot => 'robot1',
        HomeType.aiImage => 'robot2',
        HomeType.aiTranslator => 'robot3'
      };

  bool get leftAlign => switch (this) {
        HomeType.aiChatBot => true,
        HomeType.aiImage => false,
        HomeType.aiTranslator => true
      };

  EdgeInsets get padding => switch (this) {
        HomeType.aiChatBot => EdgeInsets.zero,
        HomeType.aiImage => EdgeInsets.all(20),
        HomeType.aiTranslator => EdgeInsets.zero
      };

  VoidCallback get onTap => switch (this) {
        HomeType.aiChatBot => () => Get.to(() => ChatBotFeature()),
        HomeType.aiImage => () => Get.to(() => ImageFeature()),
        HomeType.aiTranslator => () => Get.to(() => TranslatorFeature()),
      };
}
