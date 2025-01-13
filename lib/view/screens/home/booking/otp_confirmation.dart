import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/view/widgets/custom_animated_row.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_pin_code.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

import 'receipt.dart';

class OtpConfirmation extends StatelessWidget {
  const OtpConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(title: 'Verify Card'),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                TwoTextedColumn(
                  text1: 'Verify your Card',
                  text2:
                      'Enter the OTP we sent to ************198 to verify your identity',
                  size1: 16,
                  weight1: FontWeight.w600,
                ),
                SizedBox(
                  height: 50,
                ),
                MyPinCode(
                  onChanged: (v) {},
                  onCompleted: (v) {},
                ),
                MyText(
                  text: '00:59',
                  textAlign: TextAlign.center,
                  paddingTop: 20,
                  paddingBottom: 50,
                ),
                AnimatedRow(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(text: "Didn’t receive OTP?"),
                      MyText(
                        text: ' Resend',
                        color: kSecondaryColor,
                        weight: FontWeight.bold,
                      )
                    ]),
                MyButton(
                  onTap: () {
                    Get.to(() => Receipt());
                  },
                  buttonText: 'Verify OTP',
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
