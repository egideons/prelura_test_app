import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prelura_test_app/app/postage_settings/modules/postage_settings_option.dart';
import 'package:prelura_test_app/app/wardrobe/modules/my_app_bar.dart';
import 'package:prelura_test_app/src/constants/consts.dart';
import 'package:prelura_test_app/src/controller/postage_settings_controller.dart';

class PostageSettings extends GetView<PostageSettingsController> {
  const PostageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: dismissKeyboard,
      child: Scaffold(
        appBar: myAppBar(colorScheme, title: "Postage Settings"),
        body: SafeArea(
          child: SingleChildScrollView(
            controller: controller.scrollController,
            physics: const BouncingScrollPhysics(),
            child:
                // Obx(() {
                //   return
                Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  postageSettingsOption(
                    colorScheme,
                    controller,
                    optionTitle: "Royal Mail",
                    editIsActive: controller.royalMailEditIsActive,
                    switchIsActive: controller.royalMailSwitchIsActive,
                    toggleSwitch: controller.toggleRoyalMailSwitch,
                    editPostageOptions: controller.editRoyalMail,
                    textFormFieldEC: controller.royalMailPriceEC,
                    textFormFieldFN: controller.royalMailPriceFN,
                    expansionTileTitle: controller.royalMailExpansionTileTitle,
                    expansionTileController:
                        controller.royalMailExpansionTileController,
                    expansionTileTitleColor:
                        controller.royalMailExpansionTitleColor,
                    generatedLength:
                        controller.royalMailDeliveryDurationList.length,
                    saveFunction: controller.saveRoyalMailSettings,
                    buttonIsLoadingValue: controller.isSavingRoyalMail,
                    listTileOnTap: controller.selectRoyalMailDurationOption,
                    listTileItems: controller.royalMailDeliveryDurationList,
                  ),
                  postageSettingsOption(
                    colorScheme,
                    controller,
                    optionTitle: "DPD",
                    editIsActive: controller.dpdEditIsActive,
                    switchIsActive: controller.dpdSwitchIsActive,
                    toggleSwitch: controller.toggleDPDSwitch,
                    editPostageOptions: controller.editDPD,
                    textFormFieldEC: controller.dpdPriceEC,
                    textFormFieldFN: controller.dpdPriceFN,
                    expansionTileTitle: controller.dpdExpansionTileTitle,
                    expansionTileController:
                        controller.dpdExpansionTileController,
                    expansionTileTitleColor: controller.dpdExpansionTitleColor,
                    generatedLength: controller.dpdDeliveryDurationList.length,
                    saveFunction: controller.saveDPDSettings,
                    buttonIsLoadingValue: controller.isSavingDPD,
                    listTileOnTap: controller.selectDPDDurationOption,
                    listTileItems: controller.dpdDeliveryDurationList,
                  ),
                  postageSettingsOption(
                    colorScheme,
                    controller,
                    optionTitle: "FedEx",
                    editIsActive: controller.fedExEditIsActive,
                    switchIsActive: controller.fedExSwitchIsActive,
                    toggleSwitch: controller.toggleFedExSwitch,
                    editPostageOptions: controller.editFedEx,
                    textFormFieldEC: controller.fedExPriceEC,
                    textFormFieldFN: controller.fedExPriceFN,
                    expansionTileTitle: controller.fedExExpansionTileTitle,
                    expansionTileController:
                        controller.fedExExpansionTileController,
                    expansionTileTitleColor:
                        controller.fedExExpansionTitleColor,
                    generatedLength:
                        controller.fedExDeliveryDurationList.length,
                    saveFunction: controller.saveFedExSettings,
                    buttonIsLoadingValue: controller.isSavingfedEx,
                    listTileOnTap: controller.selectFedExDurationOption,
                    listTileItems: controller.fedExDeliveryDurationList,
                    isLast: true,
                  ),
                ],
              ),
            ),
            // }),
          ),
        ),
      ),
    );
  }
}
