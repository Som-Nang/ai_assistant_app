import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/model/onboard.dart';
import 'package:ai_assistant/screen/home_screen.dart';
import 'package:ai_assistant/widget/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();
    final list = [
      Onboard(
          title: 'Ask me Anything',
          subtitle:
              'I can be your Best Friend & You can ask me anything & I will help you',
          lottie: 'askMe'),
      Onboard(
          title: 'Imagination to Reality',
          subtitle:
              'Just Imagine anything & let me know, I will create something wonderful for you',
          lottie: 'aiBase'),
    ];
    return Scaffold(
        body: PageView.builder(
            controller: c,
            itemCount: list.length,
            itemBuilder: (ctx, ind) {
              final isLast = ind == list.length - 1;
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Lottie.asset('assets/lottie/${list[ind].lottie}.json',
                        height: mq.height * .6),
                    Text(
                      list[ind].title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          letterSpacing: .5),
                    ),
                    SizedBox(height: mq.height * .01),
                    SizedBox(
                      width: mq.width * .7,
                      child: Text(
                        list[ind].subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13.5,
                            letterSpacing: .5,
                            color: Theme.of(context).lightTextColor),
                      ),
                    ),
                    Spacer(),
                    Wrap(
                      spacing: 10,
                      children: List.generate(
                        list.length,
                        (i) => Container(
                            width: i == ind ? 15 : 10,
                            height: 8,
                            decoration: BoxDecoration(
                                color: i == ind ? Colors.blue : Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                      ),
                    ),
                    const Spacer(),
                    CustomBtn(
                        onTap: () {
                          if (isLast) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => const HomeScreen()));
                          } else {
                            c.nextPage(
                                duration: Duration(milliseconds: 1500),
                                curve: Curves.ease);
                          }
                        },
                        text: isLast ? 'Finish' : 'Next'),
                    // ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //         shape: const StadiumBorder(),
                    //         elevation: 0,
                    //         textStyle: TextStyle(
                    //             fontSize: 16, fontWeight: FontWeight.w500),
                    //         minimumSize: Size(mq.width * .4, 50)),
                    //     onPressed: () {
                    //       if (isLast) {
                    //         Navigator.of(context).pushReplacement(
                    //             MaterialPageRoute(
                    //                 builder: (_) => const HomeScreen()));
                    //       } else {
                    //         c.nextPage(
                    //             duration: Duration(milliseconds: 1500),
                    //             curve: Curves.ease);
                    //       }
                    //     },
                    //     child: Text(isLast ? 'Finish' : 'Next')),
                    const Spacer(flex: 2),
                  ],
                ),
              );
            }));
  }
}
