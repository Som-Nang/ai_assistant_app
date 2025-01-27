import 'package:ai_assistant/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../helper/global.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;
  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return Card(
      color: Colors.blue.withOpacity(.2),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      elevation: 0,
      margin: EdgeInsets.only(bottom: mq.height * .02),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        onTap: homeType.onTap,
        child: homeType.leftAlign
            ? Row(
                children: [
                  // Lottie.asset('assets/lottie/askMe.json', width: mq.width * .35),
                  Container(
                    width: mq.width * .35,
                    padding: homeType.padding,
                    child: Image.asset('assets/images/${homeType.image}.png',
                        width: mq.width * .30),
                  ),
                  Spacer(),
                  Text(
                    homeType.title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  ),
                  Spacer(flex: 2),
                ],
              )
            : Row(
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    homeType.title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  ),
                  Spacer(),
                  Container(
                    width: mq.width * .35,
                    padding: homeType.padding,
                    child: Image.asset('assets/images/${homeType.image}.png',
                        width: mq.width * .30),
                  ),
                ],
              ),
      ),
    ).animate().fade(duration: 1.seconds, curve: Curves.easeIn);
  }
}
