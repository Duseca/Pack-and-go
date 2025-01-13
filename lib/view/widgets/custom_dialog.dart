import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_fonts.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {super.key,
      this.ontap,
      this.title,
      this.subtitle,
      this.btncolor,
      this.btncolor2,
      this.btntext,
      this.fontcolor1,
      this.fontcolor2,
      this.isrow = true,
      this.iscol = F,
      this.path,
      this.btntext2});
  final String? title, subtitle, btntext, btntext2, path;
  final Color? btncolor, btncolor2, fontcolor1, fontcolor2;
  final bool? isrow, iscol;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Background blur effect
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 2.0, sigmaX: 2),
                child: Container(
                  color: Colors.black
                      .withOpacity(0.02), // Add opacity to background
                ),
              ),
            ),
            // Your content
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kPrimaryColor,
                            border: Border.all(color: ktransparent)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 10),
                            CommonImageView(
                              imagePath: path ?? Assets.imagesLOGO,
                              width: Get.width,
                              height: 120,
                              fit: BoxFit.contain,
                            ),
                            MyText(
                              text: title ?? 'Log Out Now?',
                              paddingTop: 20,
                              textAlign: TextAlign.center,
                              paddingBottom: 10,
                              fontFamily: AppFonts.URBANIST,
                              size: 18,
                              weight: FontWeight.w600,
                            ),
                            MyText(
                              text: subtitle ??
                                  'Log In back and your data will be safe with us.',
                              textAlign: TextAlign.center,
                              paddingBottom: 20,
                              color: ksubtextColor,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MyButton(
                                    gradient: transparentgrad(),
                                    onTap: ontap ??
                                        () {
                                          //   Get.to(() => Login());
                                        },
                                    buttonText: btntext ?? 'Logout',

                                    backgroundColor:
                                        btncolor ?? kSecondaryColor2,
                                    fontColor: fontcolor1 ?? kSecondaryColor,

                                    //  fontColor: kPrimaryColor,
                                  ),
                                ),
                                if (isrow == true)
                                  SizedBox(
                                    width: 10,
                                  ),
                                if (isrow == true)
                                  Expanded(
                                    child: MyButton(
                                      onTap: ontap ??
                                          () {
                                            //   Get.to(() => Login());
                                          },
                                      buttonText: btntext2 ?? 'Log Out',

                                      backgroundColor: btncolor2 ?? kRedColor,
                                      fontColor: fontcolor2 ?? kSecondaryColor,
                                      //  fontColor: kPrimaryColor,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            if (iscol == true)
                              MyButton(
                                onTap: ontap ??
                                    () {
                                      //   Get.to(() => Login());
                                    },
                                buttonText: 'Rate User',

                                backgroundColor: btncolor2 ?? kSecondaryColor,
                                fontColor: fontcolor2 ?? kPrimaryColor,
                                //  fontColor: kPrimaryColor,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
