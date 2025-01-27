//Android Dark Theme
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prelura_test_app/theme/colors.dart';

ThemeData androidDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  applyElevationOverlayColor: false,
  textTheme: GoogleFonts.interTextTheme(),
  expansionTileTheme: ExpansionTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
      side: BorderSide(width: 0.8, color: kDivideColor),
    ),
    collapsedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
      side: BorderSide(width: 0.8, color: kDivideColor),
    ),
  ),
  colorScheme: ColorScheme.dark(
    surface: kDarkBackgroundSolidColor,
    primary: kPrimaryColor,
    secondary: kAccentColor,
    inverseSurface: kLightBackgroundColor,
    brightness: Brightness.dark,
    error: Colors.red,
  ),
);
