//default value
import 'package:flutter/material.dart';

const kDefaultPadding = 20.0;
const kHalfDefaultPadding = 10.0;

extension SizedBoxExtension on int {
  Widget get toHeight {
    return SizedBox(
      height: toDouble(),
    );
  }

  Widget get toWidth {
    return SizedBox(
      width: toDouble(),
    );
  }
}

//=============== REGEX =============\\

class RegexPatterns {
  static const String poundSign = '\u00A3';
}

defaultTextStyle({
  Color? color,
  Paint? background,
  Color? backgroundColor,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
  String? debugLabel,
  String? fontFamily,
  double? fontSize,
  FontStyle? fontStyle,
  FontWeight? fontWeight,
  double? letterSpacing,
}) =>
    TextStyle(
      color: color ?? Colors.grey,
      background: background,
      backgroundColor: backgroundColor,
      decoration: decoration ?? TextDecoration.none,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      debugLabel: debugLabel,
      fontFamily: fontFamily ?? "Inter",
      fontSize: fontSize ?? 14.0,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w500,
      letterSpacing: letterSpacing ?? 0,
    );
