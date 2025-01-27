import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prelura_test_app/src/constants/consts.dart';
import 'package:prelura_test_app/theme/colors.dart';

defaultTextFormField(
  ColorScheme colorScheme, {
  void Function()? onTap,
  bool? enabled,
  bool readOnly = false,
  required TextEditingController controller,
  required FocusNode focusNode,
  required TextInputType keyboardType,
  required TextInputAction textInputAction,
  List<TextInputFormatter>? inputFormatters,
  TextCapitalization? textCapitalization,
  required String hintText,
  EdgeInsetsGeometry? contentPadding,
  // String? errorText,
  String? prefixText,
  String? suffixText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  void Function(String)? onChanged,
  void Function(String)? onFieldSubmitted,
}) {
  return TextFormField(
    onTap: onTap,
    enabled: enabled,
    readOnly: readOnly,
    controller: controller,
    focusNode: focusNode,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    cursorColor: colorScheme.primary,
    inputFormatters: inputFormatters ?? [],
    onChanged: onChanged,
    onFieldSubmitted: onFieldSubmitted,
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
      prefixText: prefixText,
      suffixText: suffixText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      // errorText: errorText ?? "",
      prefixStyle: TextStyle(
        color: colorScheme.inverseSurface,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.2,
      ),
      suffixStyle: TextStyle(
        color: colorScheme.inverseSurface,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.2,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 1, color: colorScheme.primary),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 1, color: colorScheme.error),
      ),
      contentPadding: contentPadding ?? const EdgeInsets.all(10),
      hintStyle: defaultTextStyle(
        color: kTextGreyColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 1, color: Colors.grey.shade600),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 1, color: Colors.grey.shade600),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 1, color: colorScheme.error),
      ),
    ),
  );
}
