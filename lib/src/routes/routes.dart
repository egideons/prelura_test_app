import 'package:get/get.dart';
import 'package:prelura_test_app/app/add_payment_card/add_payment_card.dart';
import 'package:prelura_test_app/app/bank_account/add_bank_account.dart';
import 'package:prelura_test_app/app/postage_settings/postage_settings.dart';
import 'package:prelura_test_app/app/wardrobe/wardrobe.dart';
import 'package:prelura_test_app/src/controller/add_bank_account_controller.dart';
import 'package:prelura_test_app/src/controller/add_payment_card_controller.dart';
import 'package:prelura_test_app/src/controller/postage_settings_controller.dart';
import 'package:prelura_test_app/src/controller/wardrobe_controller.dart';

class Routes {
  //Splash screens
  static const wardrobe = "/wardrobe";
  static const addBankAccount = "/add-bank-account";
  static const postageSettings = "/postage-settings";
  static const addPaymentCard = "/add-payment-card";
  //========================= GET PAGES ==========================\\
  static final getPages = [
    GetPage(
      name: wardrobe,
      page: () => const Wardrobe(),
      binding: BindingsBuilder(() => Get.lazyPut<WardrobeController>(
            () => WardrobeController(),
          )),
    ),
    GetPage(
      name: addBankAccount,
      page: () => const AddBankAccount(),
      binding: BindingsBuilder(() => Get.lazyPut<AddBankAccountController>(
            () => AddBankAccountController(),
          )),
    ),
    GetPage(
      name: postageSettings,
      page: () => const PostageSettings(),
      binding: BindingsBuilder(() => Get.lazyPut<PostageSettingsController>(
            () => PostageSettingsController(),
          )),
    ),
    GetPage(
      name: addPaymentCard,
      page: () => const AddPaymentCard(),
      binding: BindingsBuilder(() => Get.lazyPut<AddPaymentCardController>(
            () => AddPaymentCardController(),
          )),
    ),
  ];
}
