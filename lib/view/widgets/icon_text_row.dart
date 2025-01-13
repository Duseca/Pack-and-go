import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/custom_animated_row.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class IconTextRow extends StatelessWidget {
  const IconTextRow(
      {super.key,
      this.iconpath,
      this.text,
      this.textcolor,
      this.iconcolor,
      this.padends,
      this.textsize,
      this.iconsize,
      this.crossAxisAlignment,
      this.mainAxisAlignment});
  final String? iconpath, text;
  final Color? textcolor, iconcolor;
  final double? padends, textsize, iconsize;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padends ?? 0),
      child: AnimatedRow(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: [
          if (mainAxisAlignment == MainAxisAlignment.end)
            Expanded(
              child: SizedBox(),
            ),
          Image.asset(
            color: iconcolor ?? null,
            iconpath ?? Assets.imagesOnline,
            height: iconsize ?? 17,
          ),
          Expanded(
              child: MyText(
            paddingLeft: 5,
            color: textcolor ?? kGrey5Color,
            text: text ?? '15 min • 1.5km ',
            size: textsize ?? 11,
          ))
        ],
      ),
    );
  }
}
