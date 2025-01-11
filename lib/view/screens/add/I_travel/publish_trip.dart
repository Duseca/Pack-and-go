import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/view/screens/add/I_travel/basic_info.dart';
import 'package:pack_and_go/view/screens/add/I_travel/publish_now.dart';
import 'package:pack_and_go/view/screens/add/I_travel/set_price.dart';
import 'package:pack_and_go/view/screens/add/I_travel/weight_limit.dart';
import 'package:pack_and_go/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';

class PublishTrip extends StatefulWidget {
  const PublishTrip({super.key});

  @override
  State<PublishTrip> createState() => _PublishTripState();
}

class _PublishTripState extends State<PublishTrip> {
  final PageController controller = PageController();

  bool onLastPage = false;
  int currentpage = 1;
  final List<Widget> screens = [
    BasicInfo(),
    WeightLimit(),
    SetPrice(),
    PublishNow()
  ];

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      screens.length,
      (index) => screens,
    );
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(title: 'Publish Trip'),
          Expanded(
            child: PageView.builder(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == pages.length - 1);
                  currentpage = index + 1;
                });
              },
              itemCount: pages.length,
              itemBuilder: (_, index) {
                return screens[index % pages.length];
              },
            ),
          ),
          if (onLastPage)
            MyButton(
              onTap: () {},
              buttonText: 'Review Bookings',
              gradient: transparentgrad(),
              fontColor: kSecondaryColor,
              mhoriz: 20,
              mBottom: 20,
            ),
          MyButton(
            mBottom: 40,
            mhoriz: 20,
            buttonText: currentpage == 1
                ? 'Next'
                : currentpage == 2
                    ? 'Set Weight'
                    : currentpage == 3
                        ? 'Set Price'
                        : 'Publish Now',
            onTap: () {
              onLastPage
                  ? Get.to(() => BottomNavBar())
                  : controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
            },
          )
        ],
      ),
    );
  }
}
