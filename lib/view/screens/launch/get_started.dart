import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:slide_action/slide_action.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  // ignore: unused_field
  Timer? _timer; // Add a Timer field

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        // startAnimation = true;
      });
    });

    // Initialize and start the timer
    _timer = Timer(Duration(seconds: 0), () {
      if (mounted) {
        Get.bottomSheet(
          StartSheet(),
          backgroundColor: ktransparent,
          barrierColor: ktransparent,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  physics: const BouncingScrollPhysics(),
                  children: [],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StartSheet extends StatelessWidget {
  const StartSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 12),
          Center(
            child: CommonImageView(
              imagePath: Assets.imagesLOGO,
              height: 76,
            ),
          ),
          MyText(
            text: 'Welcome to',
            weight: FontWeight.w500,
            textAlign: TextAlign.center,
            size: 16,
          ),
          MyText(
            text: 'Danish Dart Union',
            textAlign: TextAlign.center,
            size: 22,
            weight: FontWeight.bold,
          ),
          MyText(
            text:
                'Discover and join exciting tournaments and\nevents around you.',
            color: kTertiaryColor.withOpacity(0.8),
            textAlign: TextAlign.center,
            paddingBottom: 20,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SimpleExample(
              trackHeight: 64,
              callback: () {
                //Get.to(() => Login());
              },
              stretchThumb: true,
              resetCurve: Curves.bounceOut,
              resetDuration: const Duration(milliseconds: 3000),
            ),
          ),
        ],
      ),
    );
  }
}

class SimpleExample extends StatelessWidget {
  const SimpleExample({
    this.rightToLeft = false,
    this.callback,
    this.stretchThumb = false,
    this.resetCurve = Curves.easeOut,
    this.resetDuration = const Duration(milliseconds: 400),
    this.thumbWidth = 80,
    this.trackHeight = 54,
    Key? key,
  }) : super(key: key);

  final bool rightToLeft;
  final FutureOr<void> Function()? callback;
  final bool stretchThumb;
  final Curve resetCurve;
  final Duration resetDuration;
  final double? thumbWidth;
  final double trackHeight;

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      trackHeight: trackHeight,
      snapAnimationCurve: resetCurve,
      snapAnimationDuration: resetDuration,
      stretchThumb: stretchThumb,
      thumbWidth: thumbWidth,
      rightToLeft: rightToLeft,
      trackBuilder: (context, state) {
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), gradient: bggrad()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  paddingLeft: 30,
                  text: 'Swipe to Get Started',
                  color: kPrimaryColor,
                )
              ],
            ));
      },
      thumbBuilder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            gradient: bggrad(),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: stretchThumb ? 100 : double.infinity,
              child: Center(
                child: SizedBox(
                  width: 200,
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Color(0xff1FD9FF),

                      ///  shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.4), // Start color
                            const Color.fromARGB(255, 157, 41, 41)
                                .withOpacity(0.1), // End color
                          ],
                          tileMode: TileMode.clamp,
                        ).createShader(bounds);
                      },
                      child: Transform.flip(
                        flipX: true,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            Assets.imagesGifbgtrans,
                            width: 150,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      action: callback,
    );
  }
}
