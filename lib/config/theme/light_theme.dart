import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xffF6F6F6),
  fontFamily: AppFonts.URBANIST,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: kQuaternaryColor,
  ),
  splashColor: kQuaternaryColor.withOpacity(0.10),
  highlightColor: kQuaternaryColor.withOpacity(0.10),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kQuaternaryColor.withOpacity(0.1),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: kQuaternaryColor,
  ),
);
