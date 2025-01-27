import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ai_assistant/helper/global.dart';
import 'package:http/http.dart';
import 'package:translator_plus/translator_plus.dart';

class APIs {
  static Future<String> getAnswer(String question) async {
    try {
      final res = await post(
          Uri.parse(
              'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode({
            "contents": [
              {
                "parts": [
                  {"text": question}
                ]
              }
            ]
          }));
      final data = jsonDecode(res.body);
      //log('res: ${res.body}');

      //log('res: ${data['candidates'][0]['content']['parts'][0]['text']}');

      return data['candidates'][0]['content']['parts'][0]['text'];
    } catch (e) {
      log('getAnswerE: $e');
      return "Something went wrong please try again!!";
    }
  }

  static Future<List<String>> searchAiImages(String prompt) async {
    try {
      final res =
          await get(Uri.parse('https://lexica.art/api/v1/search?q=$prompt'));
      final data = jsonDecode(res.body);
      return List.from(data['images']).map((e) => e['src'].toString()).toList();
    } catch (e) {
      log('searchAiImage: $e');
      return [];
    }
  }

  static Future<String> googleTranslate(
      {required String from, required String to, required text}) async {
    try {
      final translator = GoogleTranslator();

      final res = await GoogleTranslator().translate(text, from: from, to: to);
      return res.text;
    } catch (e) {
      log('getTranslate: $e');
      return "Something went wrong";
    }
  }
}
