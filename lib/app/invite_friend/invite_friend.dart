import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prelura_test_app/src/constants/assets.dart';
import 'package:prelura_test_app/src/constants/consts.dart';
import 'package:prelura_test_app/src/controller/invite_friend_controller.dart';
import 'package:prelura_test_app/src/utils/my_app_bar.dart';
import 'package:prelura_test_app/src/utils/my_elevated_button.dart';
import 'package:prelura_test_app/src/utils/my_outlined_button.dart';
import 'package:prelura_test_app/theme/colors.dart';

class InviteFriend extends GetView<InviteFriendController> {
  const InviteFriend({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: dismissKeyboard,
      child: Scaffold(
        appBar: myAppBar(colorScheme, title: "Invite a friend"),
        body: SafeArea(
          child: SingleChildScrollView(
            controller: controller.scrollController,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: controller.inviteContact,
                  child: Container(
                    width: size.width - 60,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFA656B3),
                          Color(0xFF8C1F9D),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Invite a contact",
                          textAlign: TextAlign.start,
                          style: defaultTextStyle(
                            color: colorScheme.inverseSurface,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        10.toHeight,
                        Center(
                          child: SvgPicture.asset(Assets.phoneBookSVG),
                        ),
                        10.toHeight,
                      ],
                    ),
                  ),
                ),
                40.toHeight,
                MyOutlinedButton(
                  onPressed: controller.shareProfileLink,
                  title: "Share profile link",
                ),
                10.toHeight,
                MyElevatedButton(
                  onPressed: controller.inviteViaFaceBook,
                  buttonColor: kFaceBookColor,
                  title: "Invite via facebook",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
