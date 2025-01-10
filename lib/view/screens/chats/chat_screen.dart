import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/main.dart';
import 'package:pack_and_go/view/widgets/chat_bubble_widget.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/send_feild.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  final bool? haveInvoiceButton;
  String? clienttype;
  ChatScreen({super.key, this.haveInvoiceButton = false, this.clienttype});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, dynamic>> chat = [
    {
      'isMe': true,
      'msg': 'Hi! May I know about your item Details?',
      'otherUserName': 'Marley Calzoni',
      'otherUserImg': dummyImage,
      'msgTime': '3:53',
      'haveTaskBubble': false,
      'taskDetail': {},
    },
    {
      'isMe': false,
      'msg':
          'Sure, man! You can check it from the description section of the Item.',
      'otherUserName': 'Marley Calzoni',
      'otherUserImg': dummyImage3,
      'msgTime': '3:53',
      'haveTaskBubble': false,
      'taskDetail': {},
    },
    {
      'isMe': true,
      'msg': 'I see, thanks for informing!',
      'otherUserName': 'Duseca software',
      'otherUserImg': dummyImage2,
      'msgTime': '3:53',
      'haveTaskBubble': true,
      'taskDetail': {},
    },
    {
      'isMe': false,
      'msg': 'Thanks for contacting me!',
      'otherUserName': 'Duseca software',
      'otherUserImg':
          'https://images.unsplash.com/photo-1733748330558-0d56cdd25dce?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxNHx8fGVufDB8fHx8fA%3D%3D',
      'msgTime': '3:53',
      'haveTaskBubble': true,
      'taskDetail': {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor2,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Image.asset(
                Assets.imagesBACK,
                height: 22,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  CommonImageView(
                    height: 30,
                    width: 30,
                    url: dummyImage2,
                    radius: 100.0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: 'Melisa Thomas',
                        size: 14,
                        weight: FontWeight.w600,
                      ),
                      MyText(
                        text: 'Online',
                        size: 10,
                        color: kGreenColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          // Image.asset(
          //   Assets.imagesMenu,
          //   height: 19,
          // ),
          // SizedBox(
          //   width: 20,
          // )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: chat.length,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(15, 60, 15, 100),
              itemBuilder: (context, index) {
                var data = chat[index];
                return Animate(
                  effects: [
                    MoveEffect(
                        duration: Duration(milliseconds: 300 + (index * 200)))
                  ],
                  child: ChatBubble(
                    isMe: data['isMe'],
                    myImg: dummyImage,
                    msg: data['msg'],
                    otherUserImg: data['otherUserImg'],
                    otherUserName: data['otherUserName'],
                    msgTime: data['msgTime'],
                    images: index == 2
                        ? [
                            dummyImage,
                            dummyImage,
                            dummyImage,
                            dummyImage,
                          ]
                        : [],
                    haveImages: index == 2,
                  ),
                );
              },
            ),
          ),
          SendField(),
        ],
      ),
    );
  }
}
