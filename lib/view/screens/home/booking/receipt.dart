import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/home/booking_details/booking_details.dart';
import 'package:pack_and_go/view/widgets/Icon_title_subtitle.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/custom_accordian.dart';
import 'package:pack_and_go/view/widgets/custom_animated_row.dart';
import 'package:pack_and_go/view/widgets/custom_row.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(title: 'Receipt'),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: rounded2(kPrimaryColor, kPrimaryColor),
                  child: Column(
                    children: [
                      Animate(
                        effects: [
                          ScaleEffect(
                            duration: Duration(milliseconds: 500),
                          )
                        ],
                        child: CommonImageView(
                          imagePath: Assets.imagesSuccess2,
                          height: 56,
                        ),
                      ),
                      MyText(
                        paddingTop: 10,
                        text: 'Payment Success!',
                        size: 16,
                        weight: FontWeight.bold,
                      ),
                      MyText(
                        text: '\$15.60',
                        size: 24,
                        weight: FontWeight.w600,
                        paddingBottom: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomAccordion(
                  children: [
                    CustomRow(
                        colorLeft: kGrey5Color,
                        sizeleft: 14,
                        sizeright: 16,
                        weightright: FontWeight.bold,
                        weightleft: FontWeight.normal,
                        left: 'Ref Number',
                        right: '000085752257'),
                    CustomRow(
                        colorLeft: kGrey5Color,
                        sizeleft: 14,
                        sizeright: 16,
                        weightright: FontWeight.bold,
                        weightleft: FontWeight.normal,
                        left: 'Payment Status',
                        hasRight: false,
                        rightIcon: AnimatedRow(children: [
                          CommonImageView(
                            imagePath: Assets.imagesTick,
                            height: 20,
                          ),
                          MyText(
                            text: 'Success',
                            weight: FontWeight.w600,
                            paddingLeft: 10,
                          )
                        ]),
                        right: '000085752257'),
                    CustomRow(
                        colorLeft: kGrey5Color,
                        sizeleft: 14,
                        sizeright: 16,
                        weightright: FontWeight.bold,
                        weightleft: FontWeight.normal,
                        left: 'Payment Time',
                        right: '25-02-2023, 13:22:16'),
                    SizedBox(
                      height: 10,
                    ),
                    DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(8),
                        dashPattern: [6, 6, 6],
                        padding: const EdgeInsets.all(0),
                        color: kGrey5Color.withOpacity(0.7),
                        strokeWidth: 1.0,
                        child: Container(
                          width: Get.width,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRow(
                        colorLeft: kGrey5Color,
                        sizeleft: 14,
                        sizeright: 20,
                        weightright: FontWeight.bold,
                        weightleft: FontWeight.normal,
                        left: 'Total Payment',
                        right: '\$15.60'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: rounded2(kPrimaryColor, kPrimaryColor),
                  child: IconTitleSubtitle(
                    iconheight: 48,
                    path: Assets.imagesHelp,
                    title: 'Trouble With Your Payment?',
                    subtitle: 'Let us know on help center now!',
                    trailing: CommonImageView(
                      imagePath: Assets.imagesRight2,
                      height: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
          MyButton(
            onTap: () {
              Get.to(() => BookingDetails());
            },
            buttonText: 'View Booking',
            mBottom: 40,
            mhoriz: 20,
          )
        ],
      ),
    );
  }
}
