import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/main.dart';
import 'package:pack_and_go/view/screens/home/results/profile_details.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/icon_text_row.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

class BookingTile extends StatelessWidget {
  const BookingTile(
      {super.key,
      this.animationDuration,
      this.istrip = false,
      this.isrequest = false,
      this.ontap});
  final int? animationDuration;
  final bool? istrip;
  final bool? isrequest;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        if (isrequest == false)
          MoveEffect(
              begin: Offset(200, 0),
              duration: Duration(milliseconds: animationDuration ?? 300))
      ],
      child: Container(
        margin: isrequest == false ? EdgeInsets.symmetric(vertical: 10) : null,
        padding: isrequest == false ? EdgeInsets.all(8) : null,
        decoration:
            isrequest == false ? rounded2(kPrimaryColor, kPrimaryColor) : null,
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
                  onTap: ontap ??
                      () {
                        Get.to(() => ProfileDetails());
                      },
                  buttonText: 'See Details',
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
                      size2: 12,
                      size1: 12,
                      text1: 'Booking Date',
                      text2: '14 May,2024 - 10:30 am '),
                ),
                Expanded(
                  child: TwoTextedColumn(
                    text1: 'Weight',
                    text2: '10 Kg',
                    size2: 12,
                    size1: 12,
                  ),
                ),
                Expanded(
                  child: TwoTextedColumn(
                    text1: 'Price',
                    text2: '\$155',
                    size2: 12,
                    size1: 12,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RequestsTile extends StatelessWidget {
  const RequestsTile({super.key, this.duration});
  final int? duration;
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        MoveEffect(
            begin: Offset(100, 0),
            duration: Duration(milliseconds: duration ?? 300))
      ],
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: rounded2(kPrimaryColor, kPrimaryColor),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                      child: CommonImageView(
                    url: dummyImage,
                    height: 136,
                  )),
                  Expanded(
                      child: CommonImageView(
                    url: dummyImage2,
                    height: 136,
                  )),
                  Expanded(
                      child: CommonImageView(
                    url: dummyImage3,
                    height: 136,
                  )),
                ],
              ),
              Animate(
                effects: [
                  MoveEffect(
                      begin: Offset(0, -100),
                      duration: Duration(milliseconds: 300))
                ],
                child: Container(
                  color: kPrimaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: BookingTile(
                      isrequest: true,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
