import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddPaymentCardController extends GetxController {
  static AddPaymentCardController get instance {
    return Get.find<AddPaymentCardController>();
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
  var fullNameEC = TextEditingController();
  var cardNumberEC = TextEditingController();
  var dateEC = TextEditingController();
  var cvvEC = TextEditingController();

//!================ Focus Nodes ================\\
  var fullNameFN = FocusNode();
  var cardNumberFN = FocusNode();
  var dateFN = FocusNode();
  var cvvFN = FocusNode();

//!================ Variables ================\\
  // Rx<SvgPicture> cardTextFormFieldPrefixIcon = SvgPicture(null).obs;
  DateTime? lastSelectedDate;

//!================ Booleans ================\\
  var isLoading = false.obs;

//!================ Functions =================//
  cardNumberOnChanged(String value) {
    if (value.length > 4) {
      // cardTextFormFieldPrefixIcon.value =
      //     SvgPicture.asset(Assets.masterCardSVG);
    }
  }

  selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: lastSelectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );
    if (selectedDate != null) {
      lastSelectedDate = selectedDate;
      dateEC.text = DateFormat("dd/MM/yyyy").format(selectedDate);
    }
  }

  //================ Form =================//
  onFieldSubmitted(value) {
    save();
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
