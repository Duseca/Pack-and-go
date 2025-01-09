import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_fonts.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/auth/login.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class VerificationSuccessful extends StatelessWidget {
  const VerificationSuccessful(
      {super.key,
      this.ontap,
      this.title,
      this.subtitle,
      this.path,
      this.btntxt,
      this.hasnotnow = false});
  final String? title, subtitle, btntxt, path;
  final bool? hasnotnow;
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
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kPrimaryColor,
                            border: Border.all(color: kGreyColor)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 10),
                            CommonImageView(
                              imagePath: path ?? Assets.imagesSuccess,
                              width: Get.width,
                              height: 90,
                              fit: BoxFit.contain,
                            ),
                            MyText(
                              text: title ?? 'Password Changed Successfully',
                              paddingTop: 20,
                              textAlign: TextAlign.center,
                              paddingBottom: 10,
                              fontFamily: AppFonts.URBANIST,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                            MyText(
                              text: subtitle ??
                                  'Your password has been updated successfully, please do not share your password with any one',
                              textAlign: TextAlign.center,
                              paddingLeft: 0,
                              paddingRight: 0,
                              paddingBottom: 20,
                              color: kGrey5Color,
                            ),
                            MyButton(
                              onTap: ontap ??
                                  () {
                                    Get.to(() => Login());
                                  },
                              buttonText: btntxt ?? 'Log In Now',
                              mhoriz: 20,
                              mBottom: 20,
                              //  fontColor: kPrimaryColor,
                            ),
                            if (hasnotnow == true)
                              MyBorderButton(
                                buttonText: 'Not Now',
                                onTap: () {},
                                borderColor: kGrey1Color,
                              ),
                            // const SizedBox(height: 20),
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
