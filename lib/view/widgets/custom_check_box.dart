import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';

// ignore: must_be_immutable
class CustomCheckBox extends StatelessWidget {
  CustomCheckBox(
      {Key? key,
      required this.isActive,
      required this.onTap,
      this.unSelectedColor,
      this.selectedColor,
      this.iscircle})
      : super(key: key);

  final bool isActive;
  final VoidCallback onTap;
  Color? unSelectedColor, selectedColor;
  bool? iscircle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: 230,
        ),
        curve: Curves.easeInOut,
        height: 19,
        width: 19,
        decoration: BoxDecoration(
          color: isActive
              ? selectedColor ?? kSecondaryColor.withOpacity(0.1)
              : Colors.transparent,
          border: Border.all(
            width: 1.0,
            color: isActive
                ? unSelectedColor ?? kSecondaryColor.withOpacity(0.1)
                : unSelectedColor ?? kGrey5Color,
          ),
          borderRadius: BorderRadius.circular(iscircle == true ? 50 : 5),
        ),
        child: !isActive
            ? SizedBox()
            : Icon(
                Icons.check,
                size: 11,
                color: isActive == true ? kSecondaryColor : ktransparent,
              ),
      ),
    );
  }
}
