import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/main.dart';
import 'package:pack_and_go/view/screens/chats/chat_screen.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/custom_animated_row.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class ChatHeads extends StatelessWidget {
  const ChatHeads({super.key, this.url, this.isread, this.duration});
  final String? url;
  final bool? isread;
  final int? duration;
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        MoveEffect(
            duration: Duration(milliseconds: duration ?? 300),
            begin: Offset(100, 0))
      ],
      child: Bounce(
        onPressed: () {
          Get.to(() => ChatScreen());
        },
        duration: Duration(milliseconds: 300),
        child: Container(
          decoration: rounded(kPrimaryColor),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: AnimatedRow(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonImageView(
                url: url ?? dummyImage,
                height: 40,
                width: 40,
                radius: 100,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        MyText(
                          text: 'Lucas Klein',
                          size: 16,
                          weight: FontWeight.w600,
                        ),
                        MyText(
                          text: '10:30 Pm',
                          paddingLeft: 5,
                          size: 10,
                        )
                      ],
                    ),
                    MyText(
                      text: 'Lorem ipsum dolor sit amet',
                      size: 12,
                      color: ksubtextColor,
                    )
                  ],
                ),
              ),
              if (isread == true)
                Container(
                  decoration: circle(kSecondaryColor, kSecondaryColor),
                  height: 18,
                  width: 18,
                  child: Center(
                      child: MyText(
                    size: 8,
                    text: '01',
                    color: kPrimaryColor,
                  )),
                )
            ],
          ),
        ),
      ),
    );
  }
}
