import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';

BoxDecoration circle(Color color, Color? borderColor) {
  return BoxDecoration(
      shape: BoxShape.circle,
      color: color,
      border: Border.all(color: borderColor ?? Colors.transparent));
}

BoxDecoration rounded(Color color) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: color,
    boxShadow: [
      BoxShadow(
        color: kBlack2Color.withOpacity(0.1),
        blurRadius: 10,
        offset: Offset(2, 2), // Shadow position
      ),
    ],
  );
}

BoxDecoration roundedsr(Color color, double radius) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: color,
    boxShadow: [
      BoxShadow(
        color: kBlack2Color.withOpacity(0.2),
        blurRadius: 5,
        offset: Offset(2, 2), // Shadow position
      ),
    ],
  );
}

class KTertiaryColor {}

BoxDecoration rounded2(Color color, Color? borderColor) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: color,
    border: Border.all(
      color: borderColor ?? Colors.transparent,
    ),
  );
}

BoxDecoration graddecor() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(14),
    gradient: bggradOpacity(),
  );
}

BoxDecoration rounded2r(Color color, Color? borderColor, double radius) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: color,
      border: Border.all(color: borderColor ?? Colors.transparent));
}

BoxDecoration roundedr(Color color, double radius) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: color,
  );
}
