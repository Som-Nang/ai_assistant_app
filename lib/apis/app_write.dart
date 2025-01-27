import 'dart:developer';

import 'package:appwrite/appwrite.dart';

import '../helper/global.dart';

class AppWrite {
  static final _client = Client();
  static final _database = Databases(_client);
  static void init() {
    // Client client = Client();

    _client
            .setEndpoint(
                'https://cloud.appwrite.io/v1') // Your Appwrite Endpoint
            .setProject('679496a800319ba3ea81') // Your project ID
            .setSelfSigned(
                status:
                    true) // Use only on dev mode with a self-signed SSL cert
        ;
    getApiKey();
  }

  static Future<String> getApiKey() async {
    try {
      final d = await _database.getDocument(
          databaseId: '679499510034f6495ddb',
          collectionId: '67949985001bc60c5564',
          documentId: 'GeminiKey');
      apiKey = d.data['apiKey'];
      //log(apiKey);
      return apiKey;
    } catch (e) {
      log('$e');
      return '';
    }
  }
}
