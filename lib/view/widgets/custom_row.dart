import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/custom_animated_row.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class CustomRow extends StatelessWidget {
  const CustomRow(
      {super.key,
      required this.left,
      required this.right,
      this.colorLeft,
      this.colorRight,
      this.sizeleft,
      this.sizeright,
      this.hasRight = true,
      this.rightIcon,
      this.weightleft,
      this.weightright});
  final String left, right;
  final Color? colorLeft, colorRight;
  final double? sizeleft, sizeright;
  final FontWeight? weightleft, weightright;
  final bool? hasRight;
  final Widget? rightIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: AnimatedRow(
        children: [
          Expanded(
            child: MyText(
              text: left,
              size: sizeleft ?? 16,
              color: colorLeft ?? kGrey5Color,
              weight: weightleft ?? FontWeight.w300,
            ),
          ),
          hasRight == false
              ? rightIcon ??
                  CommonImageView(
                    //  imagePath: Assets.imagesOnboard1,
                    height: 20,
                  )
              : MyText(
                  text: right,
                  color: colorRight ?? kBlackColor,
                  size: sizeright ?? 16,
                  weight: weightright ?? FontWeight.w600,
                ),
        ],
      ),
    );
  }
}
