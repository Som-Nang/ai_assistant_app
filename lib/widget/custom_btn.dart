import 'package:ai_assistant/main.dart';
import 'package:flutter/material.dart';

import '../helper/global.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomBtn({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: Theme.of(context).buttonColor,
            elevation: 0,
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            minimumSize: Size(mq.width * .4, 50)),
        onPressed: onTap,
        child: Text(text));
  }
}
