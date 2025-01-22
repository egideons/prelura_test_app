import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prelura_test_app/app/wardrobe/modules/build_brands_from_seller.dart';
import 'package:prelura_test_app/src/constants/consts.dart';
import 'package:prelura_test_app/src/controller/wardrobe_controller.dart';
import 'package:prelura_test_app/theme/colors.dart';

brandsFromSellerSection(
  ColorScheme colorScheme,
  WardrobeController controller,
) {
  return SliverAppBar(
    backgroundColor: colorScheme.surface,
    elevation: 10,
    pinned: true,
    expandedHeight: 180,
    collapsedHeight: 180,
    floating: true,
    flexibleSpace: Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: colorScheme.surface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Brands from this seller",
                style: defaultTextStyle(
                  color: kTextGreyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Iconsax.search_normal,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
          10.toHeight,
          SizedBox(
            height: 40,
            child: buildBrandsFromSeller(
              controller.listOfBrands,
              colorScheme,
            ),
          ),
          10.toHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Filter",
                    style: defaultTextStyle(
                      color: kTextGreyColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  4.toWidth,
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.setting_4, color: colorScheme.primary),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Sort",
                    style: defaultTextStyle(
                      color: kTextGreyColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  4.toWidth,
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.arrow_swap, color: colorScheme.primary),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
