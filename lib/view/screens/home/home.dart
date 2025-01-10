import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';

import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/home/notifications.dart';
import 'package:pack_and_go/view/screens/home/results/search_results.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_field.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: CommonImageView(
              imagePath: Assets.imagesBgrect,
              width: Get.width,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              homeAppBar(actions: [
                Bounce(
                  duration: Duration(milliseconds: 200),
                  onPressed: () {
                    Get.to(() => Notifications());
                  },
                  child: CommonImageView(
                    imagePath: Assets.imagesNotification,
                    height: 24,
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ]),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Entry(
                      xOffset: 100,
                      delay: const Duration(milliseconds: 100),
                      duration: Duration(milliseconds: 300),
                      child: MyText(
                        text: 'Start your journey now and earn money',
                        color: kPrimaryColor,
                        weight: FontWeight.w600,
                        textAlign: TextAlign.center,
                        paddingBottom: 130,
                      ),
                    ),
                    Entry(
                      xOffset: 100,
                      delay: const Duration(milliseconds: 300),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: Get.width,
                            decoration:
                                rounded2r(kPrimaryColor, kPrimaryColor, 25),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  MyTextField(
                                    filledColor: kGrey1Color.withOpacity(0.6),
                                    label: 'Departure',
                                    hint: 'Search destination',
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(13.0),
                                      child: CommonImageView(
                                        imagePath: Assets.imagesLocation,
                                        height: 14,
                                      ),
                                    ),
                                  ),
                                  MyTextField(
                                    filledColor: kGrey1Color.withOpacity(0.6),
                                    label: 'Destination',
                                    hint: 'Search destination',
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(13.0),
                                      child: CommonImageView(
                                        imagePath: Assets.imagesLocation,
                                        height: 14,
                                      ),
                                    ),
                                  ),
                                  MyText(
                                    text: 'Date of Birth',
                                    color: kSecondaryColor,
                                    paddingBottom: 5,
                                  ),
                                  Container(
                                    decoration: rounded2r(
                                        kPrimaryColor, kGrey1Color, 8),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        children: [
                                          CommonImageView(
                                            imagePath: Assets.imagesCalendar,
                                            height: 24,
                                          ),
                                          MyText(
                                            text: 'Select Date',
                                            paddingLeft: 10,
                                            color: ksubtextColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  MyTextField(
                                    filledColor: kGrey1Color.withOpacity(0.6),
                                    label: 'Weight',
                                    hint: 'Enter Weight',
                                    suffixIcon: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MyText(
                                          text: 'kg',
                                          color: ksubtextColor,
                                        )
                                      ],
                                    ),
                                    marginBottom: 20,
                                  ),
                                  MyButton(
                                    mhoriz: 10,
                                    mTop: 10,
                                    mBottom: 10,
                                    onTap: () {
                                      Get.to(() => SearchResults());
                                    },
                                    buttonText: 'Search',
                                    hasicon: true,
                                    choiceIcon: Assets.imagesSearch2,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -110,
                            right: 0,
                            left: 0,
                            child: Center(
                              child: CommonImageView(
                                imagePath: Assets.imagesInfographic,
                                height: 128,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyText(
                      text: 'Recent Trips',
                      paddingTop: 16,
                      paddingBottom: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      padding: EdgeInsets.all(0),
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration:
                              rounded2r(kPrimaryColor, kPrimaryColor, 15),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText(
                                        text: 'Thu 15 Nov, 2024',
                                        color: kSecondaryColor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          MyText(
                                            text: 'Melbourne',
                                            paddingRight: 10,
                                            weight: FontWeight.w600,
                                          ),
                                          CommonImageView(
                                            imagePath: Assets.imagesNext,
                                            height: 20,
                                          ),
                                          MyText(
                                            text: 'New York',
                                            paddingLeft: 10,
                                            weight: FontWeight.w600,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          MyText(
                                            text: 'Weight: 15 Kg',
                                            paddingRight: 10,
                                          ),
                                          MyText(
                                            text: 'Bookings: 02',
                                            paddingLeft: 10,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    MyText(
                                      text: '\$150.65',
                                      weight: FontWeight.w600,
                                      paddingBottom: 5,
                                      size: 16,
                                    ),
                                    MyButton(
                                      onTap: () {},
                                      buttonText: '    See Details    ',
                                      fontSize: 12,
                                      height: 35,
                                      radius: 9,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
