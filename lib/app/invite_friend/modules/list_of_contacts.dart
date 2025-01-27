import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prelura_test_app/src/constants/consts.dart';
import 'package:prelura_test_app/src/controller/invite_friend_controller.dart';
import 'package:prelura_test_app/src/utils/my_elevated_button.dart';

class ListOfContacts extends GetView<InviteFriendController> {
  const ListOfContacts({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        primary: true,
        backgroundColor: colorScheme.surface,
        elevation: 0,
        title: Text(
          "Contacts",
          style: defaultTextStyle(
            color: colorScheme.inverseSurface,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            controller: controller.scrollController,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10),
            child: Obx(
              () => ListView.separated(
                itemCount: controller.numOfContacts.value,
                separatorBuilder: (context, index) => Divider(thickness: .4),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      controller.toggleSelection(index);
                    },
                    dense: true,
                    trailing: Obx(() {
                      final isSelected =
                          controller.selectedContacts.contains(index);
                      return Radio.adaptive(
                        value: true,
                        groupValue: isSelected,
                        activeColor: colorScheme.inverseSurface,
                        onChanged: (value) {
                          controller.toggleSelection(index);
                        },
                      );
                    }),
                    title: Text(
                      controller.contactName.value,
                      textAlign: TextAlign.start,
                      style: defaultTextStyle(
                        color: colorScheme.inverseSurface,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: colorScheme.surface),
        child: Obx(() {
          return MyElevatedButton(
            title: "Invite",
            disable: controller.selectedContacts.isEmpty,
            onPressed: controller.inviteSelectedContacts,
          );
        }),
      ),
    );
  }
}
