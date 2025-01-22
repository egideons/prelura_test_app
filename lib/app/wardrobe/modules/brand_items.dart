// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:prelura_test_app/src/constants/consts.dart';
import 'package:prelura_test_app/theme/colors.dart';

brandItems(ColorScheme colorScheme, String item) {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(4),
    child: Container(
      padding: const EdgeInsets.all(10),
      constraints: BoxConstraints(minWidth: 80),
      decoration: ShapeDecoration(
        color: kPrimaryColor.withOpacity(.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: colorScheme.primary,
            width: 1,
          ),
        ),
      ),
      child: Text(
        item,
        textAlign: TextAlign.center,
        style: defaultTextStyle(
          color: colorScheme.inverseSurface,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
