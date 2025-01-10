import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_sizes.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/chat_heads.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/custom_animated_row.dart';
import 'package:pack_and_go/view/widgets/my_text_field.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          homeAppBar(actions: [
            CommonImageView(
              imagePath: Assets.imagesNotification,
              height: 24,
            ),
            SizedBox(
              width: 20,
            )
          ]),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: AppSizes.HORIZONTAL,
                  child: MyTextField(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CommonImageView(
                        imagePath: Assets.imagesSearch3,
                        height: 13,
                      ),
                    ),
                    hint: 'Search here',
                  ),
                ),
                MyText(
                  text: 'Active Bookings',
                  size: 16,
                  paddingLeft: 20,
                  paddingBottom: 20,
                  weight: FontWeight.w600,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      for (int index = 0; index < images.length; index++)
                        Entry(
                          xOffset: 100,
                          delay: const Duration(milliseconds: 300),
                          duration: Duration(milliseconds: 300 + (index * 300)),
                          curve: Curves.ease,
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: index == 0 ? 20 : 10.0),
                            child: Stack(
                              children: [
                                CommonImageView(
                                  url: images[index],
                                  height: 54,
                                  width: 54,
                                  radius: 100,
                                ),
                                Positioned(
                                  right: 0,
                                  child: CommonImageView(
                                    imagePath: Assets.imagesOnline,
                                    height: 13,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedRow(children: [
                  MyText(
                    text: 'Other Chats ',
                    weight: FontWeight.w600,
                    paddingLeft: 20,
                  ),
                  unreadMessage()
                ]),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  padding: EdgeInsets.all(0),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ChatHeads(
                      isread: index == 0 ? true : false,
                      duration: 100 + (index * 200),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class unreadMessage extends StatelessWidget {
  const unreadMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: circle(kSecondaryColor, kSecondaryColor),
      child: Center(
        child: MyText(
          text: '03',
          size: 8,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}

List<String> images = [
  'https://images.unsplash.com/photo-1520600661691-801f48869ee4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fHw%3D',
  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
];
