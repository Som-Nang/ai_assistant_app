import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/pref.dart';
import 'home_screen.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (context) =>
      //         Pref.showOnboarding ? OnboardingScreen() : HomeScreen()));

      Get.off(() => Pref.showOnboarding ? OnboardingScreen() : HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(mq.width * .05),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: mq.width * .4,
                ),
              ),
            ),
            Spacer(),
            CustomLoading(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
