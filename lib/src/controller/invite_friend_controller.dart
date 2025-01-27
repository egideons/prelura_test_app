import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prelura_test_app/app/invite_friend/modules/share_profile_link_widget.dart';
import 'package:prelura_test_app/app/invite_friend/modules/show_animated_dialog.dart';
import 'package:prelura_test_app/src/routes/routes.dart';
import 'package:prelura_test_app/theme/colors.dart';

class InviteFriendController extends GetxController {
  static InviteFriendController get instance {
    return Get.find<InviteFriendController>();
  }

//!================ Controllers ================\\
  var scrollController = ScrollController();

//!================ Focus Nodes ================\\

//!================ Variables ================\\
  var profileLink = "Prelura.com/sdjvhsdElWhsa064".obs;
  var selectedContacts = <int>[].obs;
  var numOfContacts = 20.obs;
  var contactName = "Ade".obs;
  void toggleSelection(int index) {
    if (selectedContacts.contains(index)) {
      selectedContacts.remove(index);
      log("Deselected: $index");
    } else {
      selectedContacts.add(index);
      log("Selected: $index");
    }

    log("Updated List: $selectedContacts");
  }

//!================ Booleans ================\\
  var isLoading = false.obs;
  var shareProfileLinkButtonIsVisible = true.obs;

//!================ Functions =================//

  Future<void> inviteContact() async {
    Get.toNamed(Routes.listOfContacts);
  }

  Future<void> inviteSelectedContacts() async {
    Get.back();
  }

  Future<void> shareProfileLink() async {
    var context = Get.context!;

    showAnimatedDialog(
      context: context,
      child: ShareProfileLinkWidget(),
    );
  }

  copyProfileLink() async {
    await Clipboard.setData(ClipboardData(text: profileLink.value));
    Get.snackbar(
      "Copied",
      "Profile link copied to clipboard!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: kPrimaryColor,
      duration: Duration(seconds: 2),
    );
  }

  Future<void> inviteViaFaceBook() async {}
}
