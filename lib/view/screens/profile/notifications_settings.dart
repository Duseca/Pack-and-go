import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';

class NotificationsSettings extends StatelessWidget {
  const NotificationsSettings({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> generalNotifications = [
      'Sound',
      'Vibrate',
      'Reminder',
      'Chats',
      'Daily Workouts',
      'Diets',
      'App Updates',
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(title: 'Notification Settings'),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                for (int i = 0; i < generalNotifications.length; i++)
                  Row(
                    children: [
                      Expanded(child: MyText(text: generalNotifications[i])),
                      Transform.scale(
                          scale: 0.7,
                          child: Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: kGrey5Color.withOpacity(0.1),
                                    blurRadius: 20,
                                    spreadRadius: 0)
                              ]),
                              child: Switch(
                                value: i == 0 ? true : false,
                                inactiveTrackColor: Color(0xffD5D5D5),
                                trackOutlineWidth: WidgetStatePropertyAll(0),
                                onChanged: (v) {},
                                activeColor: kGreenColor,
                                thumbColor:
                                    WidgetStatePropertyAll(kPrimaryColor),
                              )))
                    ],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
