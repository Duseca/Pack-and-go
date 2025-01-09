import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/view/screens/history/all.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

final List<String> _tabs = ['All', 'On Going', 'Cacelled', 'Completed'];
int _currentIndex = 0;
final List<Widget> tabBarView = [
  All(),
  All(),
  All(),
  All(),
];

class _MyBookingsState extends State<MyBookings> {
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 40,
              margin: EdgeInsets.only(bottom: 4),
              decoration: rounded2r(kGrey1Color, ktransparent, 100),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _tabs.length,
                        (index) {
                          return GestureDetector(
                            onTap: () => _onTap(index),
                            child: AnimatedContainer(
                              padding: EdgeInsets.all(4),
                              margin: EdgeInsets.all(4),
                              duration: const Duration(milliseconds: 300),
                              height: Get.height,
                              decoration: BoxDecoration(
                                  gradient:
                                      _currentIndex == index ? bggrad() : null,
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      color: _currentIndex == index
                                          ? ktransparent
                                          : ktransparent)
                                  // color: ktransparent,
                                  ),
                              child: Center(
                                child: MyText(
                                  text: _tabs[index],
                                  paddingLeft: 7,
                                  paddingRight: 7,
                                  size: 13,
                                  weight: FontWeight.w600,
                                  color: _currentIndex == index
                                      ? kPrimaryColor
                                      : kBlackColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: IndexedStack(
              children: tabBarView,
              index: _currentIndex,
            ),
          ),
        ],
      ),
    );
  }
}
