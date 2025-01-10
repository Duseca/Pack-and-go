import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

String getImagePath(String notificationType) {
  switch (notificationType) {
    case 'booking':
      return Assets.imagesHistorygrad;
    case 'publish':
      return Assets.imagesPublish;
    case 'message':
      return Assets.imagesMessage;
    case 'review':
      return Assets.imagesReview;
    case 'cancel':
      return Assets.imagesCancell;
    default:
      return Assets.imagesHistorygrad; // Default image if type doesn't match
  }
}

class NotificatrionsTile extends StatelessWidget {
  const NotificatrionsTile({super.key, this.notificationType, this.duration});
  final String? notificationType;
  final int? duration;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Animate(
        effects: [MoveEffect(delay: Duration(milliseconds: duration ?? 200))],
        child: AnimatedContainer(
            padding: EdgeInsets.all(10),
            decoration: rounded2(kPrimaryColor, kGrey1Color),
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: duration ?? 200),

            // Animate from right to left
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: circle(kGrey1Color, kGrey1Color),
                  height: 49,
                  width: 49,
                  child: Center(
                    child: CommonImageView(
                      imagePath: getImagePath(notificationType ?? 'booking'),
                      height: 24,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: 'Muhammad Just Booked a Package',
                      size: 12,
                      weight: FontWeight.w500,
                      paddingBottom: 8,
                    ),
                    MyText(
                        size: 12,
                        color: ksubtextColor,
                        text: "Pin I'm artisan 90's chambray batch")
                  ],
                )),
                IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 5,
                        color: Color(0xff19F7FF),
                      ),
                      MyText(
                        paddingTop: 33,
                        text: '10:30 Pm',
                        size: 8,
                        color: ksubtextColor,
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
