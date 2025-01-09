import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/view/screens/history/my_bookings.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<String> _tabs = ['My Bookings', 'My Requests'];
  final List<Widget> tabBarView = [
    MyBookings(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          homeAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 4),
              decoration: rounded2r(kGrey1Color, kGrey1Color, 100),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _tabs.length,
                        (index) {
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => _onTap(index),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 4),
                                child: AnimatedContainer(
                                  padding: EdgeInsets.all(8),
                                  duration: const Duration(milliseconds: 300),
                                  height: Get.height,
                                  decoration: BoxDecoration(
                                      gradient: _currentIndex == index
                                          ? bggrad()
                                          : null,
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          color: _currentIndex == index
                                              ? ktransparent
                                              : kGrey2Color)
                                      // color: ktransparent,
                                      ),
                                  child: Center(
                                    child: MyText(
                                      text: _tabs[index],
                                      paddingLeft: 16,
                                      paddingRight: 16,
                                      size: 13,
                                      weight: FontWeight.w600,
                                      color: _currentIndex == index
                                          ? kPrimaryColor
                                          : kBlackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
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
