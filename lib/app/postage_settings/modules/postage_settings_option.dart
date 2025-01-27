import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:prelura_test_app/src/constants/consts.dart';
import 'package:prelura_test_app/src/controller/postage_settings_controller.dart';
import 'package:prelura_test_app/src/utils/default_text_form_field.dart';
import 'package:prelura_test_app/src/utils/my_elevated_button.dart';
import 'package:prelura_test_app/theme/colors.dart';

postageSettingsOption(
  ColorScheme colorScheme,
  PostageSettingsController controller, {
  required String optionTitle,
  required RxString expansionTileTitle,
  required RxBool editIsActive,
  required RxBool switchIsActive,
  required void Function(bool?) toggleSwitch,
  required void Function() editPostageOptions,
  required TextEditingController textFormFieldEC,
  required FocusNode textFormFieldFN,
  required ExpansionTileController expansionTileController,
  required Rx<Color> expansionTileTitleColor,
  required int generatedLength,
  required void Function(int) listTileOnTap,
  required void Function() saveFunction,
  required RxBool buttonIsLoadingValue,
  required RxList<Map<String, Object>> listTileItems,
  bool isLast = false,
}) {
  return Obx(() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      curve: Curves.easeIn,
      constraints: BoxConstraints(minHeight: 60),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorScheme.inverseSurface,
            width: .2,
          ),
          bottom: isLast == true
              ? BorderSide(
                  color: colorScheme.inverseSurface,
                  width: .2,
                )
              : BorderSide.none,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  optionTitle,
                  textAlign: TextAlign.start,
                  style: defaultTextStyle(
                    color: colorScheme.inverseSurface,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (!editIsActive.value)
                InkWell(
                  onTap: switchIsActive.value ? editPostageOptions : null,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: switchIsActive.value
                          ? colorScheme.primary
                          : Colors.grey.shade600,
                    ),
                    child: Icon(CupertinoIcons.pen),
                  ),
                ),
              10.toWidth,
              Switch.adaptive(
                value: switchIsActive.value,
                onChanged: toggleSwitch,
                activeTrackColor: colorScheme.primary,
                activeColor: Colors.white,
                inactiveTrackColor: Colors.grey.shade600,
                padding: const EdgeInsets.all(0),
                trackOutlineWidth: WidgetStatePropertyAll(0),
                trackOutlineColor: WidgetStatePropertyAll(
                  Colors.grey.shade600,
                ),
              ),
            ],
          ),
          10.toHeight,
          if (editIsActive.value) ...[
            defaultTextFormField(
              colorScheme,
              controller: textFormFieldEC,
              focusNode: textFormFieldFN,
              enabled: false,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.none,
              hintText: "Price",
              prefixText: textFormFieldEC.text.isEmpty
                  ? controller.prefixText.value
                  : RegexPatterns.poundSign,
            ),
            10.toHeight,
            ExpansionTile(
              dense: true,
              controller: expansionTileController,
              tilePadding: EdgeInsets.symmetric(horizontal: 10),
              trailing: Icon(
                Icons.arrow_drop_down_rounded,
                color: Colors.grey.shade400,
              ),
              title: Text(
                expansionTileTitle.value,
                textAlign: TextAlign.start,
                style: defaultTextStyle(
                  color: expansionTileTitleColor.value,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              children: List.generate(
                generatedLength,
                (index) {
                  var item = listTileItems[index];
                  return ListTile(
                    onTap: () {
                      listTileOnTap(index);
                    },
                    title: Text(
                      "${item["title"]}",
                      textAlign: TextAlign.start,
                      style: defaultTextStyle(
                        color: item["isSelected"] == true
                            ? Colors.white
                            : kTextGreyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),
            20.toHeight,
            // Obx(() {
            //   return
            MyElevatedButton(
              onPressed: saveFunction,
              // disable: !controller.isChecked.value,
              isLoading: buttonIsLoadingValue.value,
              title: "Save",
            ),
            // }),
          ],
        ],
      ),
    );
  });
}
