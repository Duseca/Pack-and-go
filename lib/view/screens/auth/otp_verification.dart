import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/view/screens/auth/other_details.dart';
import 'package:pack_and_go/view/screens/auth/reset_password.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_pin_code.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key, this.verifyOtp = false});
  final bool? verifyOtp;
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
                  text: verifyOtp == true ? 'Verify OTP' : 'Verify Email',
                  weight: FontWeight.bold,
                  size: 18,
                ),
                MyText(
                  text:
                      'Enter the OTP we have sent to your email to verify your account.',
                  color: ksubtextColor,
                  size: 12,
                  paddingBottom: 40,
                ),
                MyPinCode(
                  onChanged: (v) {},
                  onCompleted: (v) {},
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: 'Didn’t receive OTP?',
                      color: kGrey5Color,
                    ),
                    MyText(
                      text: '  Resend',
                      color: kSecondaryColor,
                    )
                  ],
                ),
                MyButton(
                  buttonText: 'Verify Otp',
                  onTap: () {
                    if (verifyOtp == true) {
                      Get.to(() => ResetPassword());
                    } else {
                      Get.to(() => OtherDetails());
                    }
                  },
                  mTop: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
