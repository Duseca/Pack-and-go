import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_fonts.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/add/publish.dart';
import 'package:pack_and_go/view/screens/chats/chats.dart';
import 'package:pack_and_go/view/screens/history/history.dart';
import 'package:pack_and_go/view/screens/home/home.dart';
import 'package:pack_and_go/view/screens/profile/profile.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late List<Map<String, dynamic>> items;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    updateItems();
  }

  void updateItems() {
    items = [
      {
        'image': currentIndex == 0
            ? Assets.imagesSearch
            : Assets.imagesSearchunselected,
        'label': 'Search',
      },
      {
        'image': currentIndex == 1 ? Assets.imagesAddgrad : Assets.imagesAdd,
        'label': 'Publish',
      },
      {
        'image':
            currentIndex == 2 ? Assets.imagesInboxgrad : Assets.imagesInbox,
        'label': 'Inbox',
      },
      {
        'image':
            currentIndex == 3 ? Assets.imagesHistorygrad : Assets.imagesHistory,
        'label': 'History',
      },
      {
        'image':
            currentIndex == 4 ? Assets.imagesProfilegrad : Assets.imagesProfile,
        'label': 'Profile',
      },
    ];
  }

  final List<Widget> screens = [
    const Home(),
    const Home(),
    const Chats(),
    const History(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        height: Platform.isIOS ? null : 70,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.10),
              offset: const Offset(0, -2),
              blurRadius: 20,
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          onTap: (index) {
            if (index == 1) {
              Get.to(() => Publish());
            } else
              setState(() {
                currentIndex = index;
                log(currentIndex.toString());
                updateItems(); // Update items when index changes
              });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedLabelStyle: TextStyle(
            fontFamily: AppFonts.URBANIST,
            color: kSecondaryColor,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: AppFonts.URBANIST,
            color: kGrey8Color,
          ),
          selectedItemColor: kSecondaryColor,
          unselectedItemColor: kGrey8Color,
          items: List.generate(
            items.length,
            (index) {
              return BottomNavigationBarItem(
                icon: CommonImageView(
                  imagePath: items[index]['image'],
                  width: 27,
                ),
                label: items[index]['label'],
              );
            },
          ),
        ),
      ),
    );
  }
}
