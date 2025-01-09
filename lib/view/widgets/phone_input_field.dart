import 'package:country_code_picker/country_code_picker.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_styling.dart';
import 'package:pack_and_go/view/widgets/common_image_view_widget.dart';

class PhoneNumberInput extends StatefulWidget {
  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ktransparent)),
      child: Row(
        children: [
          Container(
            decoration: rounded2(kPrimaryColor, kGrey1Color),
            child: Row(
              children: [
                CountryCodePicker(
                  flagWidth: 30,
                  margin: EdgeInsets.all(0),
                  flagDecoration: circle(kPrimaryColor, kPrimaryColor),
                  padding: EdgeInsets.all(0),
                ),
                CommonImageView(
                  //imagePath: Assets.imagesDown,
                  height: 8,
                ),
                SizedBox(
                  width: 12,
                )
              ],
            ),
          ),
          // Country Code Dropdown

          SizedBox(width: 9.0),

          // Phone Number TextField
          Expanded(
            child: Container(
              decoration: rounded2(kPrimaryColor, kGrey1Color),
              child: TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: '1234567890',

                      //  hintStyle: mystyle12white,
                      border: InputBorder.none)),
            ),
          ),
        ],
      ),
    );
  }
}
