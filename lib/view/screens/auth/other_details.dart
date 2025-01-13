import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/screens/add/i_send_package/upload_imgss.dart';
import 'package:pack_and_go/view/screens/auth/set_password.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/custom_animated_row.dart';
import 'package:pack_and_go/view/widgets/custom_drop_down.dart';
import 'package:pack_and_go/view/widgets/my_button.dart';
import 'package:pack_and_go/view/widgets/my_text_field.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';
import 'package:pack_and_go/view/widgets/simple_app_bar.dart';

class OtherDetails extends StatelessWidget {
  const OtherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: simpleAppBar(
            bgColor: Color(0xfff6f6f6),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    MyText(
                      paddingTop: 0,
                      text: 'Other Details',
                      weight: FontWeight.bold,
                      size: 18,
                    ),
                    MyText(
                      text: 'Please fill out personal details to get started.',
                      color: ksubtextColor,
                      size: 12,
                      paddingBottom: 20,
                    ),
                    MyTextField(
                      label: 'Location',
                    ),
                    CustomDropDown(
                        label: 'Nationality',
                        hint: 'Searcha nd select nationality',
                        items: ['Searcha nd select nationality'],
                        selectedValue: 'Searcha nd select nationality',
                        onChanged: (v) {}),
                    MyText(
                      text: 'Date of Birth',
                      color: kSecondaryColor,
                      paddingBottom: 5,
                    ),
                    Container(
                      decoration: rounded2r(kPrimaryColor, kGrey1Color, 8),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            CommonImageView(
                              imagePath: Assets.imagesCalendar,
                              height: 24,
                            ),
                            MyText(
                              text: 'Select Date',
                              paddingLeft: 10,
                              color: ksubtextColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomDropDown(
                        label: 'Gender',
                        hint: 'Male',
                        items: ['Male', 'Female', 'Others'],
                        selectedValue: 'Male',
                        onChanged: (v) {}),
                    MyTextField(
                      label: 'Phone Number',
                      isoptional: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CommonImageView(
                          imagePath: Assets.imagesPhone,
                          height: 14,
                        ),
                      ),
                      hint: 'Phone number',
                      marginBottom: 20,
                    ),
                    MyText(
                      text: 'Upload an identity document (Id card / Passeport)',
                      weight: FontWeight.bold,
                      paddingBottom: 20,
                    ),
                    AnimatedRow(children: [
                      Expanded(
                          child: UploadTile(
                        title: 'Upload Front',
                        size: 10,
                        height: 23,
                        color: kGrey5Color,
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: UploadTile(
                        color: kGrey5Color,
                        title: 'Upload Back',
                        size: 10,
                        height: 23,
                      )),
                    ]),
                    SizedBox(
                      height: 30,
                    ),
                    MyButton(
                        onTap: () {
                          Get.to(() => SetPassword());
                        },
                        buttonText: 'Next')
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 44.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonImageView(
                imagePath: Assets.imagesLOGO,
                height: 36,
              ),
            ],
          ),
        )
      ],
    );
  }
}
