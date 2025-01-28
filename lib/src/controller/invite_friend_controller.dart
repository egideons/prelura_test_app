import 'package:fast_contacts/fast_contacts.dart';
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

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

//!================ Controllers ================\\
  var scrollController = ScrollController();

//!================ Variables ================\\
  var profileLink = "Prelura.com/sdjvhsdElWhsa064".obs;
  var selectedContacts = <String>[].obs;
  var displayedContacts = <Contact>[].obs;
  var contacts = <Contact>[].obs;

//!================ Integers ================\\
  final int pageSize = 20;
  int currentPage = 0;

//!================ Booleans ================\\
  var isLoading = false.obs;
  var isPaginating = false.obs;
  var hasMoreContacts = false.obs;
  var isLoadingMore = false.obs;

//!================ Functions =================//

  goToListContacts() {
    Get.toNamed(Routes.listOfContacts);
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
