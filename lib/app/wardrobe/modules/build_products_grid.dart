import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prelura_test_app/src/constants/consts.dart';
import 'package:prelura_test_app/src/controller/wardrobe_controller.dart';
import 'package:prelura_test_app/theme/colors.dart';

buildProductsGrid(ColorScheme colorScheme, WardrobeController controller) {
  return SliverGrid(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.48,
      mainAxisSpacing: 16,
      crossAxisSpacing: 14,
    ),
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        final product = controller.products[index % controller.products.length];
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(product.productImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 6,
                      right: 6,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          constraints: BoxConstraints(minWidth: 60),
                          decoration: ShapeDecoration(
                            color: colorScheme.surface,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.heart,
                                  size: 16,
                                  color: colorScheme.inverseSurface,
                                ),
                                2.toWidth,
                                Text(
                                  product.numOfLikes.toString(),
                                  style: defaultTextStyle(
                                    color: colorScheme.inverseSurface,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                10.toHeight,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.brandName,
                      style: defaultTextStyle(
                        color: colorScheme.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    5.toHeight,
                    Text(
                      product.productName,
                      style: defaultTextStyle(
                        color: colorScheme.inverseSurface,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    5.toHeight,
                    Text(
                      product.description,
                      style: defaultTextStyle(
                        color: kTextGreyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    5.toHeight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              if (product.isDiscounted)
                                Text(
                                  "${RegexPatterns.poundSign}${product.price}",
                                  style: defaultTextStyle(
                                    color: kTextGreyColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              if (product.isDiscounted) 10.toWidth,
                              Text(
                                "${RegexPatterns.poundSign}${product.isDiscounted ? product.discountPrice : product.price}",
                                style: defaultTextStyle(
                                  color: colorScheme.inverseSurface,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (product.isDiscounted)
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration:
                                BoxDecoration(color: colorScheme.secondary),
                            constraints: BoxConstraints(minWidth: 60),
                            child: Text(
                              "${product.discountPercentage}% Off",
                              textAlign: TextAlign.center,
                              style: defaultTextStyle(
                                color: colorScheme.inverseSurface,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                      ],
                    ),
                    5.toHeight,
                  ],
                ),
              ],
            ),
          ),
        );
      },
      childCount: 100,
    ),
  );
}
