import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prelura_test_app/app/wardrobe/modules/my_app_bar.dart';
import 'package:prelura_test_app/src/constants/assets.dart';
import 'package:prelura_test_app/src/constants/consts.dart';
import 'package:prelura_test_app/src/controller/add_payment_card_controller.dart';
import 'package:prelura_test_app/src/utils/card_number_text_input_formatter.dart';
import 'package:prelura_test_app/src/utils/default_text_form_field.dart';
import 'package:prelura_test_app/src/utils/my_elevated_button.dart';

class AddPaymentCard extends GetView<AddPaymentCardController> {
  const AddPaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: dismissKeyboard,
      child: Scaffold(
        appBar: myAppBar(colorScheme, title: "Add a payment card"),
        body: SafeArea(
          child: SingleChildScrollView(
            controller: controller.scrollController,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full name",
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
                    controller: controller.fullNameEC,
                    focusNode: controller.fullNameFN,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    hintText: "",
                  ),
                  40.toHeight,
                  Text(
                    "Card Name",
                    textAlign: TextAlign.start,
                    style: defaultTextStyle(
                      color: colorScheme.inverseSurface,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  10.toHeight,
                  defaultTextFormField(colorScheme,
                      controller: controller.cardNumberEC,
                      focusNode: controller.cardNumberFN,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      hintText: "0000-0000-0000-0000",
                      // suffixIcon: controller.cardTextFormFieldPrefixIcon.value,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(Assets.masterCardSVG),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CardNumberTextInputFormatter(),
                      ]),
                  40.toHeight,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Date",
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
                              onTap: () {
                                controller.selectDate(context);
                              },
                              readOnly: true,
                              controller: controller.dateEC,
                              focusNode: controller.dateFN,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              hintText: "DD-MM-YYYY",
                            ),
                          ],
                        ),
                      ),
                      10.toWidth,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CVV",
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
                              controller: controller.cvvEC,
                              focusNode: controller.cvvFN,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              textCapitalization: TextCapitalization.words,
                              hintText: "000",
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  40.toHeight,
                  Obx(() {
                    return MyElevatedButton(
                      onPressed: controller.save,
                      isLoading: controller.isLoading.value,
                      title: "Save",
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
