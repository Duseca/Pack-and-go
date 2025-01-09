import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class TwoTextedColumn extends StatelessWidget {
  final String text1;
  final String text2;
  final Color? color1;
  final Color? color2;
  final FontWeight? weight1;
  final FontWeight? weight2;
  final double? size1;
  final double? size2;
  final ColumnAlignment alignment;
  const TwoTextedColumn({
    super.key,
    required this.text1,
    required this.text2,
    this.color1,
    this.color2,
    this.weight1,
    this.weight2,
    this.size1,
    this.size2,
    this.alignment = ColumnAlignment.start,
  });
  @override
  Widget build(BuildContext context) {
    // Map alignment choice to CrossAxisAlignment
    final crossAxisAlignment = {
      ColumnAlignment.start: CrossAxisAlignment.start,
      ColumnAlignment.end: CrossAxisAlignment.end,
      ColumnAlignment.center: CrossAxisAlignment.center,
    }[alignment]!; // Use ! to ensure a non-null value
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Animate(
          effects: [
            MoveEffect(delay: Duration(milliseconds: 200), begin: Offset(10, 0))
          ],
          child: MyText(
            text: text1,
            size: size1 ?? 14,
            color: color1 ?? kBlackColor,
            weight: weight1 ?? FontWeight.bold,
            paddingBottom: 3,
          ),
        ),
        Animate(
          effects: [MoveEffect()],
          child: MyText(
            text: text2,
            size: size2 ?? 14,
            color: color2 ?? kBlack2Color,
            weight: weight2 ?? FontWeight.w400,
            maxLines: 2,
            textOverflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

enum ColumnAlignment { start, end, center }
