import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/home/booking_details/verify_otp.dart';
import 'package:pack_and_go/view/widgets/Icon_title_subtitle.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/custom_animated_row.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/profile_tile.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> bookingDetails = [
      {
        "title": "Booking Status",
        "subtitle": "On Going",
      },
      {
        "title": "Destination",
        "subtitle": "Heathrow Airport, United Kingdom",
      },
      {
        "title": "Booking Date & Time",
        "subtitle": "14 May.2024 - 10:30 am",
      },
      {
        "title": "Weight",
        "subtitle": "12 Kg",
      },
      {
        "title": "Price",
        "subtitle": "\$ 156.60",
      },
      {
        "title": "Parcel Type",
        "subtitle": "Box, Clothes, Gift Box, Laptop",
      },
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(title: 'Booking Details'),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                ProfileTile(
                  trailingpath: Assets.imagesChat,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: rounded2(kPrimaryColor, kPrimaryColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (int i = 0; i < bookingDetails.length; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TwoTextedColumn(
                              text1: bookingDetails[i]['title']!,
                              text2: bookingDetails[i]['subtitle']!),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                AnimatedRow(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonImageView(
                        imagePath: Assets.imagesFlag,
                        height: 24,
                      ),
                      MyText(
                        text: 'Report User ',
                        color: kSecondaryColor,
                        weight: FontWeight.bold,
                        paddingLeft: 10,
                      )
                    ]),
                MyButton(
                  onTap: () {
                    Get.bottomSheet(VerifyOTP());
                  },
                  buttonText: 'Complete Delivery',
                  mTop: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
