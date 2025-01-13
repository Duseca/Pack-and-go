import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_sizes.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/auth/login.dart';
import 'package:pack_and_go/view/screens/launch/get_started.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingLanding extends StatefulWidget {
  @override
  State<OnboardingLanding> createState() => _OnboardingLandingState();
}

class _OnboardingLandingState extends State<OnboardingLanding> {
  final PageController controller = PageController();

  bool onLastPage = false;
  int currentpage = 1;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> screens = [
      {
        'phone': Assets.imagesPHONE1,
        'text1': 'Search for trips with ease',
        'text2':
            "Polaroid sustainable hammock of a art truffaut blue etsy. Kale readymade semiotics photo tattooed venmo. Waistcoat mi meh portland glossier tile 3-moon I'm iPhone"
      },
      {
        'phone': Assets.imagesPhone2,
        'text1': 'Easily publish your Trips & Bookings',
        'text2':
            "Polaroid sustainable hammock of a art truffaut blue etsy. Kale readymade semiotics photo tattooed venmo. Waistcoat mi meh portland glossier tile 3-moon I'm iPhone"
      },
      {
        'phone': Assets.imagesPhone3,
        'text1': 'Find the perfect choice for your parcel',
        'text2':
            "Polaroid sustainable hammock of a art truffaut blue etsy. Kale readymade semiotics photo tattooed venmo. Waistcoat mi meh portland glossier tile 3-moon I'm iPhone"
      }
    ];

    final pages = List.generate(
      screens.length,
      (index) => screens,
    );
    bool showFloatButton = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == pages.length - 1);
                currentpage = index + 1;
              });
            },
            itemCount: screens.length,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(gradient: LIGHTBLUE()),
                    child: Animate(
                      effects: [
                        MoveEffect(
                            duration: Duration(milliseconds: 1200),
                            begin: Offset(index == 1 ? 200 : -200, 700))
                      ],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: index == 1 ? 0 : 30.0,
                                  top: 30,
                                  left: index == 1 ? 30 : 0),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: CommonImageView(
                                  fit: BoxFit.contain,
                                  imagePath: screens[index]['phone'],

                                  //  width: Get.width * 0.7,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                  Container(
                    color: kPrimaryColor,
                    // clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        MyText(
                          paddingTop: 20,
                          text: screens[index]['text1'],
                          size: 20,
                          weight: FontWeight.bold,
                        ),
                        MyText(
                            paddingLeft: 20,
                            paddingRight: 20,
                            textAlign: TextAlign.center,
                            lineHeight: 2,
                            paddingBottom: 120,
                            text:
                                "Polaroid sustainable hammock of a art truffaut blue etsy. Kale readymade semiotics photo tattooed venmo. Waistcoat mi meh portland glossier tile 3-moon I'm iPhone"),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: !showFloatButton,
        child: Padding(
          padding: AppSizes.HORIZONTAL,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SmoothPageIndicator(
                count: pages.length,
                effect: ExpandingDotsEffect(
                    dotWidth: 6,
                    dotHeight: 6,
                    activeDotColor: Color(0xff1FD9FF)),
                controller: controller,
              ),
              SizedBox(
                height: 20,
              ),
              SimpleExample(
                trackHeight: 58,
                callback: () {
                  Get.to(() => Login());
                },
                stretchThumb: false,
                resetCurve: Curves.bounceOut,
                resetDuration: const Duration(milliseconds: 3000),
              ),
              // MyButton(
              //   buttonText: 'Next',
              //   onTap: () {
              //     onLastPage
              //         ? Get.to(() => Login())
              //         : controller.nextPage(
              //             duration: const Duration(milliseconds: 500),
              //             curve: Curves.easeIn);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
