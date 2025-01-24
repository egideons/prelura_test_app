import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prelura_test_app/app/wardrobe/modules/my_app_bar.dart';
import 'package:prelura_test_app/src/constants/consts.dart';
import 'package:prelura_test_app/src/controller/wardrobe_controller.dart';
import 'package:prelura_test_app/src/utils/default_text_form_field.dart';
import 'package:prelura_test_app/src/utils/text_formatters.dart';

class WardrobeScreen extends GetView<WardrobeController> {
  const WardrobeScreen({super.key});

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
        appBar: myAppBar(colorScheme, title: "Add a bank account"),
        body: SafeArea(
          child: RefreshIndicator.adaptive(
            onRefresh: controller.onRefresh,
            child: SingleChildScrollView(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sort code",
                      textAlign: TextAlign.start,
                      style: defaultTextStyle(
                        color: colorScheme.inverseSurface,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    10.toHeight,
                    defaultTextFormField(
                      colorScheme,
                      controller: controller.sortCodeEC,
                      focusNode: controller.sortCodeFN,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      hintText: "00-00-00",
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        SortCodeTextInputFormatter(),
                      ],
                    ),
                    40.toHeight,
                    Text(
                      "Account number",
                      textAlign: TextAlign.start,
                      style: defaultTextStyle(
                        color: colorScheme.inverseSurface,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    10.toHeight,
                    defaultTextFormField(
                      colorScheme,
                      controller: controller.acctNumberEC,
                      focusNode: controller.acctNumberFN,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(8),
                      ],
                      textCapitalization: TextCapitalization.none,
                      hintText: "000000",
                      contentPadding: const EdgeInsets.all(10),
                      errorText: null,
                      prefixIcon: null,
                      suffixIcon: null,
                    ),
                    // brandHeaderSection(colorScheme, controller),
                    // brandsFromSellerSection(colorScheme, controller),
                    // buildProductsGrid(colorScheme, controller),
                    // SliverToBoxAdapter(
                    //     child:
                    //    Container(
                    //     margin: const EdgeInsets.all(20),
                    //     height: 10,
                    //     width: 10,
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: kGreyColor,
                    //     ),
                    //   ),
                    // ),

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
        ),
      ),
    );
  }
}
