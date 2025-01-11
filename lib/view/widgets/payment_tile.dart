import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class PaymentTile extends StatefulWidget {
  final int option;
  final String title, path;
  final bool? isselected;
  final VoidCallback ontap;
  final Duration? duration;
  PaymentTile({
    super.key,
    required this.ontap,
    required this.option,
    this.isselected,
    required this.title,
    required this.path,
    this.duration,
  });

  @override
  State<PaymentTile> createState() => _PaymentTileState();
}

class _PaymentTileState extends State<PaymentTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 3),
      child: Animate(
        effects: [
          MoveEffect(duration: widget.duration, begin: Offset(100, 0)),
        ],
        child: Bounce(
          duration: Duration(milliseconds: 200),
          onPressed: widget.ontap,
          child: AnimatedContainer(
            decoration: rounded2(
                widget.isselected == true
                    ? kSecondaryColor.withOpacity(0.1)
                    : kPrimaryColor,
                widget.isselected == true
                    ? kSecondaryColor
                    : kSecondaryColor2.withOpacity(0.5)),
            padding: EdgeInsets.all(10),
            duration: Duration(
              milliseconds: 200,
            ),
            curve: Curves.easeInOut,
            child: Row(
              children: [
                CommonImageView(
                  imagePath: widget.path,
                  height: 52,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: MyText(
                    text: widget.title,
                    color: widget.isselected == true
                        ? kSecondaryColor
                        : Colors.black,
                  ),
                ),
                CommonImageView(
                  imagePath: Assets.imagesRight,
                  height: 20,
                )
                // AnimatedContainer(
                //   duration: Duration(
                //     milliseconds: 230,
                //   ),
                //   curve: Curves.easeInOut,
                //   height: 21,
                //   width: 21,
                //   decoration: circle(kPrimaryColor, kGrey2Color),
                //   child: Padding(
                //     padding: const EdgeInsets.all(2.0),
                //     child: Container(
                //       decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           border: Border.all(
                //               color: widget.isselected == true
                //                   ? kSecondaryColor
                //                   : Colors.transparent,
                //               width: 5)),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
