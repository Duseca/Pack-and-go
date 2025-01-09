import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/auth/otp_verification.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/my_text_field.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';

import '../../widgets/my_button.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                MyText(
                  paddingTop: 0,
                  text: 'Forgot Password',
                  weight: FontWeight.bold,
                  size: 18,
                ),
                MyText(
                  text:
                      'Its ok to forget your password, we will help you recover your password.',
                  color: ksubtextColor,
                  size: 12,
                  paddingBottom: 20,
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
                  marginBottom: 100,
                ),
                MyButton(
                  onTap: () {
                    Get.to(() => OtpVerification(
                          verifyOtp: true,
                        ));
                  },
                  buttonText: 'Continue',
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
