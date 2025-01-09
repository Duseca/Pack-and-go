import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_fonts.dart';

import 'package:pinput/pinput.dart';

class MyPinCode extends StatefulWidget {
  final Function(String) onChanged;
  final Function(String) onCompleted;
  final Color? color;

  const MyPinCode({
    super.key,
    required this.onChanged,
    required this.onCompleted,
    this.color,
  });

  @override
  State<MyPinCode> createState() => _MyPinCodeState();
}

class _MyPinCodeState extends State<MyPinCode> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 54,
      height: 59,
      margin: EdgeInsets.all(3),
      textStyle: TextStyle(
          fontSize: 20,
          color: widget.color ?? kBlackColor,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.URBANIST),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kGrey2Color, width: 1.5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.09),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kSecondaryColor, width: 1.5),
      ),
    );

    return Pinput(
      length: 5,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.09),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kSecondaryColor, width: 1.5),
        ),
      ),
      onChanged: widget.onChanged,
      onCompleted: widget.onCompleted,
    );
  }
}
