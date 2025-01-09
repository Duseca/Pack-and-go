import 'package:flutter/material.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/main.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/custom_animated_row.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class IconTitleSubtitle extends StatelessWidget {
  const IconTitleSubtitle(
      {super.key,
      this.title,
      this.path,
      this.subtitle,
      this.iconheight,
      this.size1,
      this.gap,
      this.trailing,
      this.size2,
      this.isurl = false,
      this.color1,
      this.color2,
      this.subtitle2,
      this.hasthirdtext = false});
  final String? title, path, subtitle, subtitle2;
  final double? iconheight, size1, size2, gap;
  final Widget? trailing;
  final bool? isurl, hasthirdtext;
  final Color? color1, color2;
  @override
  Widget build(BuildContext context) {
    return AnimatedRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isurl == true
            ? CommonImageView(
                height: iconheight ?? 32,
                width: iconheight ?? 32,
                radius: 200,
                url: path ?? dummyImage,
              )
            : CommonImageView(
                height: iconheight ?? 32,
                imagePath: path ?? Assets.imagesOnline,
              ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: title ?? 'Credit or debit card',
                size: size1 ?? 16,
                weight: FontWeight.w600,
                paddingBottom: gap ?? 0,
                color: color1 ?? null,
              ),
              MyText(
                color: color2 ?? null,
                size: size2 ?? 14,
                text: subtitle ?? 'Visa, Mastercard, AMEX and JCB',
              ),
              if (hasthirdtext == true)
                MyText(
                  color: color2 ?? null,
                  size: size2 ?? 14,
                  text: subtitle2 ?? 'Visa, Mastercard, AMEX and JCB',
                ),
            ],
          ),
        ),
        trailing ?? SizedBox()
      ],
    );
  }
}
