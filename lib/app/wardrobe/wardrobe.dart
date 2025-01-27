import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prelura_test_app/app/wardrobe/modules/brand_header_section.dart';
import 'package:prelura_test_app/app/wardrobe/modules/brands_from_seller_section.dart';
import 'package:prelura_test_app/app/wardrobe/modules/build_products_grid.dart';
import 'package:prelura_test_app/src/constants/consts.dart';
import 'package:prelura_test_app/src/controller/wardrobe_controller.dart';
import 'package:prelura_test_app/src/utils/my_app_bar.dart';
import 'package:prelura_test_app/theme/colors.dart';

class Wardrobe extends GetView<WardrobeController> {
  const Wardrobe({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: dismissKeyboard,
      child: Scaffold(
        floatingActionButton: Obx(
          () => controller.isScrollToTopBtnVisible.value
              ? FloatingActionButton.small(
                  onPressed: controller.scrollToTop,
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.inverseSurface,
                  child: const Icon(Icons.keyboard_arrow_up),
                )
              : const SizedBox(),
        ),
        appBar: myAppBar(colorScheme, title: "Wardrobe"),
        body: SafeArea(
          child: RefreshIndicator.adaptive(
            onRefresh: controller.onRefresh,
            child: CustomScrollView(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                brandHeaderSection(colorScheme, controller),
                brandsFromSellerSection(colorScheme, controller),
                buildProductsGrid(colorScheme, controller),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kGreyColor,
                    ),
                  ),
                ),

                //    Center(
                //   child: RichText(
                //     textAlign: TextAlign.center,
                //     text: TextSpan(
                //       text: "Don't ",
                //       style: defaultTextStyle(
                //         color: colorScheme.inverseSurface,
                //         fontSize: 20,
                //         fontWeight: FontWeight.w500,
                //       ),
                //       children: [
                //         WidgetSpan(
                //           child: Typewriter(
                //             controller.listOfTexts,
                //             loop: true,
                //             erase: true,
                //             tailingtext: "|",
                //             textstyle: TextStyle(
                //               color: colorScheme.primary,
                //               fontSize: 20,
                //               fontWeight: FontWeight.w600,
                //               height: 1.2,
                //               // backgroundColor: colorScheme.inverseSurface,
                //             ),
                //           ),
                //         ),
                //         TextSpan(
                //           text: "it?",
                //           style: defaultTextStyle(
                //             color: colorScheme.inverseSurface,
                //             fontSize: 20,
                //             fontWeight: FontWeight.w500,
                //           ),
                //         ),
                //         TextSpan(
                //           text: " Sell it!",
                //           style: defaultTextStyle(
                //             color: colorScheme.inverseSurface,
                //             fontSize: 20,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
