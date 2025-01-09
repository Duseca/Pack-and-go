import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

AppBar simpleAppBar({
  String? title,
  VoidCallback? onBackIconTap,
  Color? bgColor,
  Color? contentColor,
  bool? haveBackButton = true,
  List<Widget>? actions,
  double? height,
  PreferredSize? bottom,
}) {
  return AppBar(
    bottom: bottom,
    toolbarHeight: 76,
    surfaceTintColor: kPrimaryColor,
    foregroundColor: kPrimaryColor,
    backgroundColor: bgColor ?? kPrimaryColor,
    shadowColor: kPrimaryColor,
    centerTitle: T,
    leadingWidth: haveBackButton == false ? 0 : null,
    leading: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 10,
        ),
        if (haveBackButton!)
          GestureDetector(
            onTap: onBackIconTap ?? () => Get.back(),
            child: Image.asset(
              Assets.imagesBACK,
              height: height ?? 40,
            ),
          ),
      ],
    ),
    title: MyText(
      text: title ?? '',
      size: 18,
      weight: FontWeight.w600,
      color: contentColor ?? kTertiaryColor,
    ),
    actions: actions,
  );
}

ClipRRect simpleAppBar2({
  String? title,
  VoidCallback? onBackIconTap,
  Color? bgColor,
  Color? contentColor,
  bool? haveBackButton = true,
  List<Widget>? actions,
  double? height,
  PreferredSize? bottom,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
    child: AppBar(
      bottom: bottom,
      toolbarHeight: 76,
      surfaceTintColor: kPrimaryColor,
      foregroundColor: kPrimaryColor,
      backgroundColor: bgColor ?? kPrimaryColor,
      shadowColor: kPrimaryColor,
      centerTitle: T,
      leadingWidth: haveBackButton == false ? 0 : null,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
          ),
          if (haveBackButton!)
            GestureDetector(
              onTap: onBackIconTap ?? () => Get.back(),
              child: Image.asset(
                Assets.imagesBACK,
                height: height ?? 40,
              ),
            ),
        ],
      ),
      title: MyText(
        text: title ?? '',
        size: 18,
        weight: FontWeight.w600,
        color: contentColor ?? kTertiaryColor,
      ),
      actions: actions,
    ),
  );
}

ClipRRect homeAppBar({
  String? title,
  VoidCallback? onBackIconTap,
  Color? bgColor,
  Color? contentColor,
  PreferredSizeWidget? bottom,
  Widget? searchwidget,
  bool? issearch = false,
  bool? haveBackButton = true,
  List<Widget>? actions,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
    child: AppBar(
      toolbarHeight: 76,
      foregroundColor: kPrimaryColor,
      surfaceTintColor: kPrimaryColor,
      backgroundColor: bgColor ?? kPrimaryColor,
      centerTitle: true,
      leadingWidth: issearch == true ? Get.width : 200,
      leading: issearch == true
          ? Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: onBackIconTap ?? () => Get.back(),
                  child: Image.asset(
                    Assets.imagesLOGO,
                    height: 24,
                  ),
                ),
                searchwidget ?? Container(),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (issearch == false)
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        Assets.imagesLOGO,
                        height: 27,
                      ),
                    ],
                  ),
                if (haveBackButton == true)
                  Row(
                    children: [],
                  ),
              ],
            ),
      title: MyText(
        text: title ?? '',
        size: 16,
        weight: FontWeight.w600,
        color: contentColor ?? kPrimaryColor,
      ),
      actions: actions ??
          [
            InkWell(
              onTap: () {
                //   Get.to(() => NotificationsPage());
              },
              child: CommonImageView(
                /// imagePath: Assets.imagesNotifications,
                height: 40,
                width: 40,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            // CommonImageView(
            //   url: dummyImage2,
            //   width: 40,
            //   height: 40,
            //   radius: 100,
            // ),
            // SizedBox(
            //   width: 20,
            // ),
          ],
      bottom: bottom,
    ),
  );
}
