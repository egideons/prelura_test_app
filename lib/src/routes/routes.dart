import 'package:get/get.dart';
import 'package:prelura_test_app/app/add_payment_card/add_payment_card.dart';
import 'package:prelura_test_app/app/bank_account/add_bank_account.dart';
import 'package:prelura_test_app/app/invite_friend/invite_friend.dart';
import 'package:prelura_test_app/app/list_of_contacts/list_of_contacts.dart';
import 'package:prelura_test_app/app/postage_settings/postage_settings.dart';
import 'package:prelura_test_app/app/wardrobe/wardrobe.dart';
import 'package:prelura_test_app/src/controller/add_bank_account_controller.dart';
import 'package:prelura_test_app/src/controller/add_payment_card_controller.dart';
import 'package:prelura_test_app/src/controller/invite_friend_controller.dart';
import 'package:prelura_test_app/src/controller/list_of_contacts_controller.dart';
import 'package:prelura_test_app/src/controller/postage_settings_controller.dart';
import 'package:prelura_test_app/src/controller/wardrobe_controller.dart';

class Routes {
  //Splash screens
  static const wardrobe = "/wardrobe";
  static const addBankAccount = "/add-bank-account";
  static const postageSettings = "/postage-settings";
  static const addPaymentCard = "/add-payment-card";
  static const inviteFriend = "/invite-friend";
  static const listOfContacts = "/list-of-contacts";
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
    GetPage(
      name: inviteFriend,
      page: () => const InviteFriend(),
      binding: BindingsBuilder(() => Get.lazyPut<InviteFriendController>(
            () => InviteFriendController(),
          )),
    ),
    GetPage(
      name: listOfContacts,
      page: () => const ListOfContacts(),
      transition: Transition.downToUp,
      binding: BindingsBuilder(() => Get.lazyPut<ListOfContactsController>(
            () => ListOfContactsController(),
          )),
    ),
  ];
}
