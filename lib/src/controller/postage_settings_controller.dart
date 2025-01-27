import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prelura_test_app/theme/colors.dart';

class PostageSettingsController extends GetxController {
  static PostageSettingsController get instance {
    return Get.find<PostageSettingsController>();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

//!================ Keys ================\\
  final formKey = GlobalKey<FormState>();

//!================ Controllers ================\\
  var scrollController = ScrollController();
  var royalMailPriceEC = TextEditingController();
  var dpdPriceEC = TextEditingController();
  var fedExPriceEC = TextEditingController();

  var royalMailExpansionTileController = ExpansionTileController();
  var dpdExpansionTileController = ExpansionTileController();
  var fedExExpansionTileController = ExpansionTileController();

//!================ Focus Nodes ================\\
  var royalMailPriceFN = FocusNode();
  var dpdPriceFN = FocusNode();
  var fedExPriceFN = FocusNode();

//!================ Booleans ================\\
  var royalMailSwitchIsActive = false.obs;
  var royalMailEditIsActive = false.obs;
  var dpdSwitchIsActive = false.obs;
  var dpdEditIsActive = false.obs;
  var fedExSwitchIsActive = false.obs;
  var fedExEditIsActive = false.obs;
  var isLoading = false.obs;
  var isSavingRoyalMail = false.obs;
  var isSavingDPD = false.obs;
  var isSavingfedEx = false.obs;

//!================ Variables ================\\
  var prefixText = "".obs;
  var royalMailExpansionTileTitle = "Delivery duration".obs;
  var dpdExpansionTileTitle = "Delivery duration".obs;
  var fedExExpansionTileTitle = "Delivery duration".obs;
  var royalMailExpansionTitleColor = kTextGreyColor.obs;
  var dpdExpansionTitleColor = kTextGreyColor.obs;
  var fedExExpansionTitleColor = kTextGreyColor.obs;
  var royalMailDeliveryDurationList = [
    {
      "title": "2-3 business days",
      "price": 3.99,
      "isSelected": false,
    },
    {
      "title": "3-5 business days",
      "price": 5.99,
      "isSelected": false,
    },
    {
      "title": "5-7 business days",
      "price": 7.99,
      "isSelected": false,
    },
  ].obs;
  var dpdDeliveryDurationList = [
    {
      "title": "2-3 business days",
      "price": 3.99,
      "isSelected": false,
    },
    {
      "title": "3-5 business days",
      "price": 5.99,
      "isSelected": false,
    },
    {
      "title": "5-7 business days",
      "price": 7.99,
      "isSelected": false,
    },
  ].obs;
  var fedExDeliveryDurationList = [
    {
      "title": "2-3 business days",
      "price": 3.99,
      "isSelected": false,
    },
    {
      "title": "3-5 business days",
      "price": 5.99,
      "isSelected": false,
    },
    {
      "title": "5-7 business days",
      "price": 7.99,
      "isSelected": false,
    },
  ].obs;

//!================ Functions =================//

  //================ Form =================//

  toggleRoyalMailSwitch(bool? value) {
    royalMailSwitchIsActive.value = !royalMailSwitchIsActive.value;
    if (royalMailSwitchIsActive.value == false) {
      royalMailEditIsActive.value = false;
    }
  }

  editRoyalMail() {
    royalMailEditIsActive.value = true;
    dpdEditIsActive.value = false;
    fedExEditIsActive.value = false;
  }

  selectRoyalMailDurationOption(index) {
    // Update the selected item
    for (int i = 0; i < royalMailDeliveryDurationList.length; i++) {
      royalMailDeliveryDurationList[i]["isSelected"] = i == index;
    }

    royalMailExpansionTileTitle.value =
        royalMailDeliveryDurationList[index]["title"].toString();
    royalMailExpansionTitleColor.value = Colors.white;
    royalMailPriceEC.text =
        royalMailDeliveryDurationList[index]["price"].toString();
    update();

    // Close the ExpansionTile
    royalMailExpansionTileController.collapse();
  }

  Future<void> saveRoyalMailSettings() async {
    isSavingRoyalMail.value = true;

    await Future.delayed(const Duration(seconds: 3));
    royalMailEditIsActive.value = false;

    isSavingRoyalMail.value = false;
  }

  toggleDPDSwitch(bool? value) {
    dpdSwitchIsActive.value = !dpdSwitchIsActive.value;
    if (dpdSwitchIsActive.value == false) {
      dpdEditIsActive.value = false;
    }
  }

  editDPD() {
    dpdEditIsActive.value = true;
    royalMailEditIsActive.value = false;
    fedExEditIsActive.value = false;
  }

  selectDPDDurationOption(index) {
    // Update the selected item
    for (int i = 0; i < dpdDeliveryDurationList.length; i++) {
      dpdDeliveryDurationList[i]["isSelected"] = i == index;
    }

    dpdExpansionTileTitle.value =
        dpdDeliveryDurationList[index]["title"].toString();
    dpdExpansionTitleColor.value = Colors.white;
    dpdPriceEC.text = dpdDeliveryDurationList[index]["price"].toString();
    update();

    // Close the ExpansionTile
    dpdExpansionTileController.collapse();
  }

  Future<void> saveDPDSettings() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      isSavingDPD.value = true;

      await Future.delayed(const Duration(seconds: 2));
      dpdEditIsActive.value = false;

      isSavingDPD.value = false;
    }
  }

  toggleFedExSwitch(bool? value) {
    fedExSwitchIsActive.value = !fedExSwitchIsActive.value;
  }

  editFedEx() {
    fedExEditIsActive.value = true;
    dpdEditIsActive.value = false;
    royalMailEditIsActive.value = false;
  }

  selectFedExDurationOption(index) {
    // Update the selected item
    for (int i = 0; i < fedExDeliveryDurationList.length; i++) {
      fedExDeliveryDurationList[i]["isSelected"] = i == index;
    }

    fedExExpansionTileTitle.value =
        fedExDeliveryDurationList[index]["title"].toString();
    fedExExpansionTitleColor.value = Colors.white;
    fedExPriceEC.text = fedExDeliveryDurationList[index]["price"].toString();
    update();

    // Close the ExpansionTile
    fedExExpansionTileController.collapse();
  }

  Future<void> saveFedExSettings() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      isSavingfedEx.value = true;

      await Future.delayed(const Duration(seconds: 2));
      fedExEditIsActive.value = false;

      isSavingfedEx.value = false;
    }
  }
}
