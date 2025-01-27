import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:prelura_test_app/src/constants/consts.dart';
import 'package:prelura_test_app/src/controller/invite_friend_controller.dart';
import 'package:prelura_test_app/src/utils/my_elevated_button.dart';

class ShareProfileLinkWidget extends GetView<InviteFriendController> {
  const ShareProfileLinkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var size = MediaQuery.sizeOf(context);
    return Container(
      height: 200,
      width: size.width - 20,
      decoration: ShapeDecoration(
        color: Color(0xFF1e1e1e),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Share profile link",
              textAlign: TextAlign.start,
              style: defaultTextStyle(
                color: colorScheme.inverseSurface,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            color: Color(0xFF101418),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  controller.profileLink.value,
                  textAlign: TextAlign.start,
                  style: defaultTextStyle(
                    color: colorScheme.inverseSurface,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          10.toHeight,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MyElevatedButton(
              title: "Copy",
              onPressed: controller.copyProfileLink,
              isRowVisible: true,
              mainAxisAlignment: MainAxisAlignment.center,
              isSwitched: true,
              buttonIcon: Icons.copy,
              buttonIconColor: colorScheme.inverseSurface,
            ),
          )
        ],
      ),
    );
  }
}
