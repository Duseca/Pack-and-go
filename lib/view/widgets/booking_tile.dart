import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/main.dart';
import 'package:pack_and_go/view/screens/home/profile_details.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/icon_text_row.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

class BookingTile extends StatelessWidget {
  const BookingTile({super.key, this.animationDuration, this.istrip = false});
  final int? animationDuration;
  final bool? istrip;
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        MoveEffect(
            begin: Offset(100, 0),
            duration: Duration(milliseconds: animationDuration ?? 300))
      ],
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(8),
        decoration: rounded(
          kPrimaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                CommonImageView(
                  url: dummyImage,
                  height: 54,
                  width: 54,
                  radius: 200,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: 'Wesley',
                        weight: FontWeight.w600,
                      ),
                      if (istrip == true)
                        IconTextRow(
                          iconpath: Assets.imagesStar,
                          text: ' 4.8',
                        ),
                      if (istrip != true)
                        MyText(
                          text: 'On Going',
                          size: 12,
                        )
                    ],
                  ),
                ),
                MyButton(
                  radius: 8,
                  onTap: () {
                    Get.to(() => ProfileDetails());
                  },
                  buttonText: '    See Details    ',
                  height: 36,
                  fontSize: 12,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TwoTextedColumn(
                      text1: 'Booking Date', text2: '14 May,2024 - 10:30 am '),
                ),
                Expanded(
                  child: TwoTextedColumn(text1: 'Weight', text2: '10 Kg'),
                ),
                Expanded(
                  child: TwoTextedColumn(text1: 'Price', text2: '\$155'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
