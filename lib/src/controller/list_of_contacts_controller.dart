import 'dart:developer';

import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ListOfContactsController extends GetxController {
  static ListOfContactsController get instance {
    return Get.find<ListOfContactsController>();
  }

  @override
  void onInit() {
    super.onInit();
    loadInitialContacts();
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }

  final scrollController = ScrollController();
  var profileLink = "Prelura.com/sdjvhsdElWhsa064".obs;
  var selectedContacts = <String>[].obs;
  var displayedContacts = <Contact>[].obs;
  var contacts = <Contact>[].obs;

  final int pageSize = 20;
  var currentPage = 0.obs;

  var isLoading = false.obs;
  var hasMoreContacts = false.obs;
  var isLoadingMore = false.obs;

  void _scrollListener() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 500 &&
        !isLoadingMore.value &&
        hasMoreContacts.value) {
      loadMoreContacts();
    }
  }

  Future<void> loadInitialContacts() async {
    try {
      isLoading.value = true;
      bool isGranted = await Permission.contacts.status.isGranted;
      if (!isGranted) {
        isGranted = await Permission.contacts.request().isGranted;
      }
      if (isGranted) {
        // Get contacts, filter those with phones, then sort alphabetically
        var allContacts = await FastContacts.getAllContacts();
        var contactsWithPhones = allContacts
            .where((contact) =>
                contact.phones.isNotEmpty &&
                contact.phones.first.number.isNotEmpty)
            .toList();

        contactsWithPhones.sort((a, b) {
          String nameA = a.structuredName?.displayName ?? a.displayName;
          String nameB = b.structuredName?.displayName ?? b.displayName;
          return nameA.toLowerCase().compareTo(nameB.toLowerCase());
        });

        contacts.value = contactsWithPhones;
        await loadInitialBatch();
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadInitialBatch() async {
    if (contacts.isEmpty) return;

    final initialBatch = contacts.take(pageSize).toList();
    displayedContacts.assignAll(initialBatch);
    currentPage.value = 1;
    hasMoreContacts.value = contacts.length > pageSize;
  }

  Future<void> loadMoreContacts() async {
    if (!hasMoreContacts.value || isLoadingMore.value) return;

    try {
      isLoadingMore.value = true;

      final startIndex = currentPage.value * pageSize;
      final endIndex = startIndex + pageSize;

      await Future.delayed(const Duration(milliseconds: 500));

      final nextBatch = contacts.skip(startIndex).take(pageSize).toList();

      displayedContacts.addAll(nextBatch);
      currentPage.value++;

      hasMoreContacts.value = contacts.length > endIndex;
    } finally {
      isLoadingMore.value = false;
    }
  }

  void toggleSelection(Contact contact) {
    if (contact.phones.isEmpty) return;
    final phoneNumber = contact.phones.first.number;
    if (selectedContacts.contains(phoneNumber)) {
      selectedContacts.remove(phoneNumber);
      log("Deselected: ${contact.displayName} - $phoneNumber");
    } else {
      selectedContacts.add(phoneNumber);
      log("Selected: ${contact.displayName} - $phoneNumber");
    }
    log("Selected Contacts: $selectedContacts");
  }

  Future<void> inviteSelectedContacts() async {
    if (selectedContacts.isNotEmpty) {
      for (var phoneNumber in selectedContacts) {
        log("Inviting contact with phone: $phoneNumber");
      }
      Get.back();
    }
  }
}
