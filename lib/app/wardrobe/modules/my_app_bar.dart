import 'package:flutter/material.dart';
import 'package:prelura_test_app/src/constants/consts.dart';

myAppBar(ColorScheme colorScheme, {String? title}) {
  return AppBar(
    centerTitle: true,
    primary: true,
    backgroundColor: colorScheme.surface,
    elevation: 0,
    title: Text(
      title ?? "",
      style: defaultTextStyle(
        color: colorScheme.inverseSurface,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
