import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/custom_animated_row.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final int starCount;
  final double size;

  StarRating({required this.rating, this.starCount = 5, this.size = 30.0});

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    double remainingRating = rating - fullStars;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        if (index < fullStars) {
          // Full star
          return Icon(
            Icons.star_rate_rounded,
            size: size,
            color: kYellowColor,
          );
        } else if (index == fullStars && remainingRating > 0) {
          // Partial star
          return Icon(
            Icons.star_half_rounded,
            size: size,
            color: kYellowColor,
          );
        } else {
          // Empty star
          return Icon(
            Icons.star_rate_rounded,
            weight: 0.25,
            size: size,
            color: kGrey2Color,
          );
        }
      }),
    );
  }
}

class RatingText extends StatelessWidget {
  const RatingText({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedRow(children: [
      CommonImageView(
        imagePath: Assets.imagesStar,
        height: 16,
      ),
      MyText(text: ' 5.0')
    ]);
  }
}
