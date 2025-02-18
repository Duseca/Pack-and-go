import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({
    required this.onTap,
    required this.buttonText,
    this.height = 48,
    this.backgroundColor,
    this.fontColor = kPrimaryColor,
    this.fontSize = 16,
    this.outlineColor = Colors.transparent,
    this.radius = 12,
    this.svgIcon,
    this.haveSvg = false,
    this.choiceIcon,
    this.isleft,
    this.mhoriz = 0,
    this.hasicon,
    this.hasshadow = false,
    this.mBottom = 0,
    this.hasgrad = true,
    this.mTop = 0,
    this.fontWeight = FontWeight.w400,
    this.gradient,
  });

  final String buttonText;
  final VoidCallback onTap;
  final double? height;
  final double radius;
  final double fontSize;
  final Color outlineColor;
  bool? hasicon, isleft, hasshadow, hasgrad;
  //Widget? choiceIcon;
  final Color? backgroundColor, fontColor;
  final String? svgIcon, choiceIcon;
  final bool haveSvg;
  final double mTop, mBottom, mhoriz;
  final FontWeight fontWeight;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: Duration(milliseconds: 100),
      onPressed: onTap,
      child: Container(
        margin: EdgeInsets.only(
            top: mTop, bottom: mBottom, left: mhoriz, right: mhoriz),
        height: height,
        decoration: hasgrad == true
            ? BoxDecoration(
                gradient: gradient ?? bggrad(),
                border: GradientBoxBorder(gradient: bggrad()),
                borderRadius: BorderRadius.circular(radius),
              )
            : BoxDecoration(
                color: backgroundColor ?? kSecondaryColor,
                border: Border.all(color: outlineColor),
                borderRadius: BorderRadius.circular(radius),
              ),
        child: Material(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: isleft == true
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              hasicon == true
                  ? Padding(
                      padding: isleft == true
                          ? const EdgeInsets.only(left: 20.0)
                          : const EdgeInsets.only(left: 0),
                      child: CommonImageView(
                        imagePath: choiceIcon,
                        height: 24,
                      ))
                  : const SizedBox.shrink(),
              MyText(
                paddingLeft: (hasicon == true) ? 10 : 0,
                text: buttonText,
                size: fontSize,
                color: fontColor,
                weight: fontWeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    required this.buttonText,
    required this.onTap,
    this.height = 48,
    this.textSize,
    this.weight,
    this.radius,
    this.customChild,
    this.bgColor,
    this.textColor,
    this.mBottom,
    this.mTop,
  });

  final String buttonText;
  final VoidCallback onTap;
  double? height, textSize, radius;
  FontWeight? weight;
  Widget? customChild;
  Color? bgColor, textColor;
  double? mTop, mBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: mTop ?? 0, bottom: mBottom ?? 0),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 8),
        color: bgColor ?? kSecondaryColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: kPrimaryColor.withOpacity(0.1),
          highlightColor: kPrimaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(radius ?? 8),
          child: customChild != null
              ? customChild
              : Center(
                  child: MyText(
                    text: buttonText,
                    size: textSize ?? 16,
                    weight: weight ?? FontWeight.w600,
                    color: textColor ?? kPrimaryColor,
                  ),
                ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyBorderButton extends StatelessWidget {
  MyBorderButton({
    required this.buttonText,
    required this.onTap,
    this.height = 48,
    this.textSize,
    this.weight,
    this.child,
    this.radius,
    this.borderColor,
    this.mBottom,
    this.mTop,
  });

  final String buttonText;
  final VoidCallback onTap;
  double? height, textSize;
  FontWeight? weight;
  Widget? child;
  double? radius;
  Color? borderColor;
  double? mTop, mBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: mTop ?? 0, bottom: mBottom ?? 0),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 8),
        color: Colors.transparent,
        border: Border.all(
          width: 1.0,
          color: borderColor ?? kSecondaryColor,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: onTap,
            splashColor: kPrimaryColor.withOpacity(0.1),
            highlightColor: kPrimaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(radius ?? 8),
            child: child != null
                ? child
                : Center(
                    child: MyText(
                      text: buttonText,
                      size: textSize ?? 14,
                      weight: weight ?? FontWeight.w700,
                      color: kSecondaryColor,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
