import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prelura_test_app/src/constants/consts.dart';
import 'package:prelura_test_app/theme/colors.dart';

defaultTextFormField(
  ColorScheme colorScheme, {
  required TextEditingController controller,
  required FocusNode focusNode,
  required TextInputType keyboardType,
  required TextInputAction textInputAction,
  List<TextInputFormatter>? inputFormatters,
  TextCapitalization? textCapitalization,
  required String hintText,
  EdgeInsetsGeometry? contentPadding,
  String? errorText,
  Widget? prefixIcon,
  Widget? suffixIcon,
}) {
  return TextFormField(
    controller: controller,
    focusNode: focusNode,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    cursorColor: colorScheme.primary,
    inputFormatters: inputFormatters ?? [],
    textCapitalization: textCapitalization ?? TextCapitalization.none,
    style: defaultTextStyle(
      color: colorScheme.inverseSurface,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    decoration: InputDecoration(
      filled: true,
      fillColor: colorScheme.surface,
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      errorText: errorText ?? "",
      // focusedBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(8),
      //   borderSide: BorderSide(width: 1, color: colorScheme.primary),
      // ),
      // focusedErrorBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(8),
      //   borderSide: BorderSide(width: 1, color: colorScheme.error),
      // ),
      contentPadding: contentPadding ?? const EdgeInsets.all(10),
      hintStyle: defaultTextStyle(
        color: kTextGreyColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1, color: kGreyColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1, color: kGreyColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1, color: colorScheme.error),
      ),
    ),
  );
}
