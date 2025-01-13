import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/home/booking_details/rate_user.dart';
import 'package:pack_and_go/view/widgets/custom_dialog.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_pin_code.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({super.key});

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Container(
        height: Get.height * 0.40,
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: [
                  TwoTextedColumn(
                    text1: 'Verify OTP',
                    text2: 'Enter the OTP Provided by the Sender.',
                    size1: 20,
                    alignment: ColumnAlignment.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyPinCode(onChanged: (v) {}, onCompleted: (v) {}),
                  MyButton(
                    onTap: () {
                      Get.back();
                      Get.dialog(CustomDialog(
                        path: Assets.imagesDone,
                        subtitle: '',
                        btntext2: 'Rate User',
                        ontap: () {
                          Get.to(() => RateUser());
                        },
                        title: 'Delivery Successful',
                        isrow: F,
                        btntext: 'Not Now',
                        iscol: T,
                      ));
                    },
                    buttonText: 'Verify',
                    mTop: 20,
                    mBottom: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
