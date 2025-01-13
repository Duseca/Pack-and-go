import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:slide_action/slide_action.dart';

class SimpleExample extends StatelessWidget {
  const SimpleExample({
    this.rightToLeft = false,
    this.callback,
    this.stretchThumb = false,
    this.resetCurve = Curves.easeOut,
    this.resetDuration = const Duration(milliseconds: 400),
    this.thumbWidth = 200,
    this.trackHeight = 64,
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
              borderRadius: BorderRadius.circular(10),
              color: kSecondaryColor.withOpacity(0.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Transform.rotate(
                    angle: 1.6,
                    child: ShaderMask(
                      shaderCallback: (bounds) {
                        return bggrad().createShader(bounds);
                      },
                      child: Image.asset(
                        Assets.imagesGifbgtrans,
                        width: 150,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ))
              ],
            ));
      },
      thumbBuilder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: stretchThumb ? 200 : double.infinity,
              child: Center(
                child: SizedBox(
                  width: 200,
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kSecondaryColor,

                      ///  shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: MyText(
                      text: 'Get Started',
                      weight: FontWeight.w600,
                      color: kPrimaryColor,
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
