import 'package:flutter/material.dart';
import 'package:prelura_test_app/app/wardrobe/modules/brand_items.dart';
import 'package:prelura_test_app/src/constants/consts.dart';

buildBrandsFromSeller(List<String> listOfBrands, ColorScheme colorScheme) {
  return ListView.separated(
    itemCount: 4,
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    separatorBuilder: (context, index) => 10.toWidth,
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      final item = listOfBrands[index];
      return brandItems(colorScheme, item);
    },
  );
}
