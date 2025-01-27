import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBankAccountController extends GetxController {
  static AddBankAccountController get instance {
    return Get.find<AddBankAccountController>();
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
  var sortCodeEC = TextEditingController();
  var acctNumberEC = TextEditingController();

//!================ Focus Nodes ================\\
  var sortCodeFN = FocusNode();
  var acctNumberFN = FocusNode();

//!================ Variables ================\\

//!================ Booleans ================\\
  var isChecked = false.obs;
  var isLoading = false.obs;

//!================ Functions =================//

  //================ Form =================//
  onFieldSubmitted(value) {
    save();
  }

  toggleCheck(bool? value) {
    isChecked.value = !isChecked.value;
  }

  Future<void> save() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 2));

      isLoading.value = false;
    }
  }
}
