import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/auth/login.dart';
import 'package:pack_and_go/view/screens/auth/otp_verification.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';

import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_field.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: CommonImageView(
                    imagePath: Assets.imagesLOGO,
                    height: 44,
                  ),
                ),
                MyText(
                  paddingTop: 30,
                  text: 'Register',
                  weight: FontWeight.bold,
                  size: 18,
                ),
                MyText(
                  text: 'Enter the data required to create an account.',
                  color: ksubtextColor,
                  size: 12,
                  paddingBottom: 40,
                ),
                MyTextField(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CommonImageView(
                      imagePath: Assets.imagesProson,
                      height: 13,
                    ),
                  ),
                  hint: 'Enter your Name',
                  label: 'First Name',
                ),
                MyTextField(
                  label: 'Last Name',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CommonImageView(
                      imagePath: Assets.imagesProson,
                      height: 13,
                    ),
                  ),
                  hint: 'Enter your Name',
                ),
                MyTextField(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CommonImageView(
                      imagePath: Assets.imagesMail,
                      height: 13,
                    ),
                  ),
                  hint: 'Enter your Email',
                  label: 'Email',
                ),
                // Row(
                //   children: [
                //     CustomCheckBox(isActive: true, onTap: () {}),
                //     MyText(
                //       text: 'Remember me',
                //       paddingLeft: 10,
                //     )
                //   ],
                // ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(text: 'Don’t have an account? '),
                    MyText(
                      onTap: () {
                        Get.to(() => Login());
                      },
                      text: '  Log In',
                      color: kSecondaryColor,
                      weight: FontWeight.w600,
                    )
                  ],
                ),
                MyButton(
                  onTap: () {
                    Get.to(() => OtpVerification());
                  },
                  buttonText: 'Register',
                  mBottom: 20, mTop: 20,
                  // mhoriz: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
