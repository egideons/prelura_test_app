// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prelura_test_app/src/constants/consts.dart';
import 'package:prelura_test_app/src/controller/list_of_contacts_controller.dart';
import 'package:prelura_test_app/src/utils/my_elevated_button.dart';

class ListOfContacts extends GetView<ListOfContactsController> {
  const ListOfContacts({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: _buildAppBar(colorScheme),
      body: SafeArea(
          child: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator.adaptive())
            : ListView.separated(
                controller: controller.scrollController,
                itemCount: controller.displayedContacts.length +
                    (controller.hasMoreContacts.value ? 1 : 0),
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 0.4),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  // Show loading indicator at the bottom when loading more
                  if (index >= controller.displayedContacts.length) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          Center(child: CircularProgressIndicator.adaptive()),
                    );
                  }

                  final contact = controller.displayedContacts[index];
                  final phoneNumber = contact.phones.isNotEmpty
                      ? contact.phones.first.number
                      : null;

                  return ListTile(
                    onTap: phoneNumber?.isNotEmpty == true
                        ? () => controller.toggleSelection(contact)
                        : null,
                    enabled: phoneNumber?.isNotEmpty == true,
                    dense: true,
                    trailing: Obx(() {
                      final isSelected =
                          controller.selectedContacts.contains(phoneNumber);
                      return Radio.adaptive(
                        value: true,
                        groupValue: isSelected,
                        activeColor: colorScheme.inverseSurface,
                        onChanged: phoneNumber?.isNotEmpty == true
                            ? (value) => controller.toggleSelection(contact)
                            : null,
                      );
                    }),
                    title: Text(
                      contact.structuredName?.displayName ??
                          contact.displayName,
                      textAlign: TextAlign.start,
                      style: defaultTextStyle(
                        color: phoneNumber?.isNotEmpty == true
                            ? colorScheme.inverseSurface
                            : colorScheme.inverseSurface.withOpacity(0.5),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
      )),
      bottomNavigationBar: _buildBottomNav(colorScheme),
    );
  }

  _buildBottomNav(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: colorScheme.surface),
      child: Obx(() {
        return MyElevatedButton(
          title: "Invite",
          disable: controller.selectedContacts.isEmpty,
          onPressed: controller.inviteSelectedContacts,
        );
      }),
    );
  }

  _buildAppBar(ColorScheme colorScheme) {
    return AppBar(
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
    );
  }
}
