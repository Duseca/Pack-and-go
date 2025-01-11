import 'package:flutter/cupertino.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_fonts.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/generated/assets.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';
import 'package:pack_and_go/view/widgets/custom_animated_row.dart';
import 'package:pack_and_go/view/widgets/icon_text_row.dart';
import 'package:pack_and_go/view/widgets/input_qty.dart';
import 'package:pack_and_go/view/widgets/my_text_field.dart';
import 'package:pack_and_go/view/widgets/my_text_widget.dart';

class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      physics: const BouncingScrollPhysics(),
      children: [
        MyTextField(
          label: 'Departure',
          hint: 'Search departure',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CommonImageView(
              imagePath: Assets.imagesLocation,
              height: 20,
            ),
          ),
          labelColor: kSecondaryColor,
        ),
        MyTextField(
          label: 'Destination',
          hint: 'Search Destination',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CommonImageView(
              imagePath: Assets.imagesLocation,
              height: 20,
            ),
          ),
          labelColor: kSecondaryColor,
        ),
        AnimatedRow(children: [
          Expanded(
            child: Bounce(
              onPressed: () {
                BottomPicker.time(
                  backgroundColor: kPrimaryColor,
                  displayCloseIcon: false,
                  titleAlignment: Alignment.center,
                  displaySubmitButton: true,
                  // dateOrder: DatePickerDateOrder.mdy,
                  dismissable: true,
                  pickerTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: AppFonts.URBANIST,
                      color: kTertiaryColor),
                  onSubmit: (date) {
                    print(date);
                  },
                  onClose: () {
                    print('Picker closed');
                  },
                  buttonContent: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Center(
                      child: MyText(
                        color: kPrimaryColor,
                        text: 'Done',
                      ),
                    ),
                  ),
                  height: Get.height * 0.5,
                  buttonWidth: Get.width * 0.9,
                  buttonStyle: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: bggrad()),

                  // initialDateTime: DateTime.now(),
                  pickerTitle: MyText(
                      text: 'Select Time',
                      weight: FontWeight.bold,
                      size: 20,
                      fontFamily: AppFonts.URBANIST,
                      color: kTertiaryColor),
                  initialTime: Time.now(),
                ).show(context);
              },
              duration: Duration(milliseconds: 200),
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: rounded2(kPrimaryColor, kGrey1Color),
                  child: IconTextRow(
                    iconpath: Assets.imagesTime,
                    text: 'Select Time',
                    crossAxisAlignment: CrossAxisAlignment.center,
                    iconsize: 24,
                    textsize: 14,
                  )),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Bounce(
              onPressed: () {
                BottomPicker.date(
                  backgroundColor: kPrimaryColor,
                  displayCloseIcon: false,
                  titleAlignment: Alignment.center,
                  displaySubmitButton: true,
                  dateOrder: DatePickerDateOrder.mdy,
                  dismissable: true,
                  pickerTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: AppFonts.URBANIST,
                      color: kTertiaryColor),
                  onSubmit: (date) {
                    print(date);
                  },
                  onClose: () {
                    print('Picker closed');
                  },
                  buttonContent: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Center(
                      child: MyText(
                        color: kPrimaryColor,
                        text: 'Done',
                      ),
                    ),
                  ),
                  height: Get.height * 0.5,
                  buttonWidth: Get.width * 0.9,
                  buttonStyle: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: bggrad()),
                  minDateTime: DateTime(1800, 11, 25),
                  maxDateTime:
                      DateTime.now().subtract(Duration(days: 14 * 365)),
                  // initialDateTime: DateTime.now(),
                  pickerTitle: MyText(
                      text: 'Select Date',
                      weight: FontWeight.bold,
                      size: 20,
                      fontFamily: AppFonts.URBANIST,
                      color: kTertiaryColor),
                ).show(context);
              },
              duration: Duration(milliseconds: 200),
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: rounded2(kPrimaryColor, kGrey1Color),
                  child: IconTextRow(
                    iconsize: 24,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textsize: 14,
                    iconpath: Assets.imagesDate,
                    text: 'Select Date',
                  )),
            ),
          )
        ]),
        SizedBox(
          height: 20,
        ),
        MyTextField(
          label: 'What to deliver?',
          labelSize: 20,
          labelWeight: FontWeight.w600,
          labelColor: kBlack2Color,
          maxLines: 4,
          hint: 'Type any thing here related to the package ',
        ),
        MyText(
          text: 'Set your weight limit in KG',
          size: 20,
          weight: FontWeight.w600,
        ),
        InputQuantity()
      ],
    );
  }
}
