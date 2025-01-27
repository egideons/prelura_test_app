import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prelura_test_app/src/constants/consts.dart';
import 'package:prelura_test_app/src/controller/add_bank_account_controller.dart';
import 'package:prelura_test_app/src/utils/default_text_form_field.dart';
import 'package:prelura_test_app/src/utils/my_app_bar.dart';
import 'package:prelura_test_app/src/utils/my_elevated_button.dart';
import 'package:prelura_test_app/src/utils/sort_code_text_input_formatter.dart';
import 'package:prelura_test_app/theme/colors.dart';

class AddBankAccount extends GetView<AddBankAccountController> {
  const AddBankAccount({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: dismissKeyboard,
      child: Scaffold(
        appBar: myAppBar(colorScheme, title: "Add a bank account"),
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
                    textInputAction: TextInputAction.done,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(8),
                    ],
                    textCapitalization: TextCapitalization.none,
                    hintText: "00000000",
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  20.toHeight,
                  Row(
                    children: [
                      Obx(() => Checkbox(
                          value: controller.isChecked.value,
                          onChanged: controller.toggleCheck,
                          checkColor: Colors.white,
                          side: BorderSide(color: Colors.grey.shade600),
                          visualDensity: VisualDensity.compact,
                          tristate: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ))),
                      Expanded(
                        child: Text(
                          "I acknowledge that I am an authorised user of this bank account",
                          textAlign: TextAlign.start,
                          style: defaultTextStyle(
                            color: kTextGreyColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  40.toHeight,
                  Obx(() {
                    return MyElevatedButton(
                      onPressed: controller.save,
                      disable: !controller.isChecked.value,
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
