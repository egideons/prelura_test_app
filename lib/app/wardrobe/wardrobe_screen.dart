import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prelura_test_app/app/wardrobe/modules/brand_header_section.dart';
import 'package:prelura_test_app/app/wardrobe/modules/brands_from_seller_section.dart';
import 'package:prelura_test_app/app/wardrobe/modules/build_products_grid.dart';
import 'package:prelura_test_app/app/wardrobe/modules/my_app_bar.dart';
import 'package:prelura_test_app/src/controller/wardrobe_controller.dart';
import 'package:prelura_test_app/theme/colors.dart';

class WardrobeScreen extends GetView<WardrobeController> {
  const WardrobeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
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
                  child: Center(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kGreyColor,
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
