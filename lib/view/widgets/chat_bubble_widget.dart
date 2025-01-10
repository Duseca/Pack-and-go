import 'package:flutter/material.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';

import '../../constants/app_colors.dart';

// ignore: must_be_immutable
class ChatBubble extends StatelessWidget {
  ChatBubble({
    Key? key,
    required this.isMe,
    required this.otherUserImg,
    required this.otherUserName,
    required this.msgTime,
    required this.msg,
    required this.myImg,
    required this.haveImages,
    required this.images,
  }) : super(key: key);

  final String msg, otherUserName, otherUserImg, msgTime, myImg;
  final bool isMe, haveImages;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return isMe ? _rightMessageBubble() : _leftMessageBubble();
  }

  Widget _rightMessageBubble() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 33.13,
        left: 50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: Image.asset(
                        Assets.imagesDoubletick,
                        height: 6.43,
                        color: kSecondaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      msgTime,
                      style: TextStyle(
                        fontSize: 10,
                        color: kGrey5Color,
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(left: 8.17),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.43,
                      vertical: 12.26,
                    ),
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.2),
                        topRight: Radius.circular(10.2),
                        bottomLeft: Radius.circular(10.2),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Text(
                      msg,
                      style: TextStyle(
                        fontSize: 12,
                        color: kPrimaryColor,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                CommonImageView(
                  url: myImg,
                  height: 40,
                  width: 40,
                  radius: 100,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _leftMessageBubble() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 33.13,
        right: 50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonImageView(
                  url: otherUserImg,
                  height: 40,
                  width: 40,
                  radius: 100,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(right: 8.17),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.43,
                      vertical: 12.26,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.51,
                        color: ktransparent,
                      ),
                      color: kSecondaryColor2,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.2),
                        topRight: Radius.circular(10.2),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(10.2),
                      ),
                    ),
                    child: Text(
                      msg,
                      style: TextStyle(
                        fontSize: 12,
                        color: ksubtextColor,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
                Text(
                  msgTime,
                  style: TextStyle(
                    fontSize: 10,
                    color: kBlackColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
