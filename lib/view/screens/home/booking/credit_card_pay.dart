import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/home/booking/otp_confirmation.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/custom_animated_row.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_field.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';
import 'package:pack_and_go/view/widgets/two_text_column.dart';

class CreditCardPay extends StatelessWidget {
  const CreditCardPay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          simpleAppBar2(title: 'Credit Card Payment'),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                TwoTextedColumn(
                  text1: 'Credit Card Payment',
                  text2: 'Enter your card details to continue to payment.',
                  size1: 16,
                  weight1: FontWeight.w600,
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedRow(
                  children: [
                    CommonImageView(
                      imagePath: Assets.imagesVisa,
                      height: 40,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: rounded2(kPrimaryColor, kGrey1Color),
                  child: MyTextField(
                    hint: 'Enter the name of Card Holder',
                    focusedFilledColor: ktransparent,
                    fbordercolor: ktransparent,
                    bordercolor: ktransparent,
                    label: 'Name on Card',
                    padends: 0,
                    marginBottom: 0,
                    isDense: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: rounded2(kPrimaryColor, kGrey1Color),
                  child: MyTextField(
                    hint: 'Enter the name of Card Holder',
                    focusedFilledColor: ktransparent,
                    fbordercolor: ktransparent,
                    bordercolor: ktransparent,
                    label: 'Name on Card',
                    padends: 0,
                    marginBottom: 0,
                    isDense: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedRow(
                  children: [
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: rounded2(kPrimaryColor, kGrey1Color),
                        child: MyTextField(
                          hint: 'Enter the name of Card Holder',
                          focusedFilledColor: ktransparent,
                          fbordercolor: ktransparent,
                          bordercolor: ktransparent,
                          label: 'Name on Card',
                          padends: 0,
                          marginBottom: 0,
                          isDense: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: rounded2(kPrimaryColor, kGrey1Color),
                        child: MyTextField(
                          hint: 'Enter the name of Card Holder',
                          focusedFilledColor: ktransparent,
                          fbordercolor: ktransparent,
                          bordercolor: ktransparent,
                          label: 'Name on Card',
                          padends: 0,
                          marginBottom: 0,
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          MyButton(
            onTap: () {
              Get.to(() => OtpConfirmation());
            },
            buttonText: 'Continue',
            mhoriz: 20,
            mBottom: 30,
          )
        ],
      ),
    );
  }
}
