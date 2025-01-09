import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pack_and_go/constants/app_fonts.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    // Start the animation and navigate to SignUpDealer after completion
    _animationController.forward().then((_) {
      Get.offAll(() => Login(),
          transition: Transition.fadeIn, duration: const Duration(seconds: 3));
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: ktransparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesLOGO,
              height: 70,
            ),
            // MyText(
            //   text: '',
            //   size: 16,
            //   //weight: FontWeight.w900,
            //   fontFamily: AppFonts.URBANIST,
            //   color: _colorAnimation2.value,
            // ),
            SizedBox(
              height: 20,
            ),
            AnimatedTextKit(animatedTexts: [
              TyperAnimatedText(
                  textAlign: TextAlign.center,
                  speed: Duration(milliseconds: 50),
                  'Send your packages effortlessly and with\npeace of mind.',
                  textStyle: TextStyle(
                    fontFamily: AppFonts.URBANIST,
                    fontSize: 16,
                    height: 2,
                  ))
            ])
          ],
        ),
      ),
    );
  }
}
