import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_fonts.dart';
import 'package:pack_and_go/constants/app_styling.dart';

class InputQuantity extends StatelessWidget {
  const InputQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return InputQty(
      qtyFormProps: QtyFormProps(
        style: TextStyle(
            fontFamily: AppFonts.URBANIST,
            fontWeight: FontWeight.w600,
            color: kBlack2Color,
            fontSize: 60),
      ),
      initVal: 01,
      minVal: 0,
      maxVal: 100,
      decoration: QtyDecorationProps(
        minusBtn: Container(
          height: 28,
          width: 28,
          decoration: rounded2r(kBlack2Color, kBlack2Color, 5),
          child: Icon(
            Icons.remove,
            size: 24,
            color: kPrimaryColor,
          ),
        ),
        plusBtn: Container(
          height: 28,
          width: 28,
          decoration: rounded2r(kBlack2Color, kBlack2Color, 5),
          child: Icon(
            Icons.add,
            size: 24,
            color: kPrimaryColor,
          ),
        ),
        isBordered: false,
        btnColor: kSecondaryColor,
        width: 12,
      ),
    );
  }
}
