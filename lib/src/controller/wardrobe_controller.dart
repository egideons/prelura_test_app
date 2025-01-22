import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prelura_test_app/src/constants/assets.dart';
import 'package:prelura_test_app/src/models/product_model.dart';
import 'package:prelura_test_app/src/models/user_model.dart';

class WardrobeController extends GetxController {
  static WardrobeController get instance {
    return Get.find<WardrobeController>();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    buildInfo();
  }

//!================ Controllers ================\\
  var scrollController = ScrollController();

//!================ Variables ================\\
  var userProfile = UserModel(
    id: 1,
    username: "Maddison2525",
    numOfStars: 5,
    numOfRatings: 300,
    location: "London, United Kingdom",
    numOfStings: 10,
    numOfFollowers: 3,
    numOfFollowings: 15,
    numOfReviews: 350,
  ).obs;
  var products = [
    ProductModel(
      id: 0,
      productName: "Nike Cropped Top",
      productImage: Assets.assetPng,
      numOfLikes: 14,
      isLiked: false,
      brandName: "Nike",
      description: "Like New",
      price: 130,
      discountPrice: 65,
      isDiscounted: true,
      discountPercentage: 50,
    ),
    ProductModel(
      id: 0,
      productName: "Gucci bag",
      productImage: Assets.assetPng,
      numOfLikes: 45,
      isLiked: false,
      brandName: "Gucci",
      description: "Like New",
      price: 650,
      discountPrice: 0,
      isDiscounted: false,
      discountPercentage: 0,
    ),
  ].obs;
  var listOfBrands = [
    "Nike",
    "Levis",
    "Vintage",
    "The North Pole",
  ];
  var profileInfo = [].obs;

  buildInfo() {
    profileInfo.value = [
      {
        "title": "Listings",
        "number": userProfile.value.numOfStings,
      },
      {
        "title": "Followings",
        "number": userProfile.value.numOfFollowings,
      },
      {
        "title": "Followers",
        "number": userProfile.value.numOfFollowers,
      },
      {
        "title": "Reviews",
        "number": userProfile.value.numOfReviews,
      },
    ];
  }

//!================ Booleans ================\\
  var isScrollToTopBtnVisible = false.obs;

//!================ Functions =================//

//=========== Scroll Listener ==========//
  void _scrollListener() {
    //========= Show action button ========//
    if (scrollController.position.pixels >= 150) {
      isScrollToTopBtnVisible.value = true;
      update();
    }
    //========= Hide action button ========//
    else if (scrollController.position.pixels < 150) {
      isScrollToTopBtnVisible.value = false;
      update();
    }
  }

  //================ Scroll to Top =================//
  void scrollToTop() => scrollController.animateTo(
        0,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );

  //================ On Refresh =================//
  Future<void> onRefresh() async {}
}
