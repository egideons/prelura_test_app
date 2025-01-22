import 'package:flutter/material.dart';
import 'package:prelura_test_app/src/constants/assets.dart';
import 'package:prelura_test_app/src/constants/consts.dart';
import 'package:prelura_test_app/src/controller/wardrobe_controller.dart';
import 'package:prelura_test_app/theme/colors.dart';

brandHeaderSection(ColorScheme colorScheme, WardrobeController controller) {
  var user = controller.userProfile.value;
  return SliverToBoxAdapter(
    child: Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorScheme.inverseSurface,
            width: .2,
          ),
          bottom: BorderSide(
            color: colorScheme.inverseSurface,
            width: .2,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: kGreyColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    Assets.memojiPng,
                  ),
                ),
                10.toWidth,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.username,
                      style: defaultTextStyle(
                        color: colorScheme.inverseSurface,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            user.numOfStars,
                            (index) => Icon(
                              Icons.star,
                              size: 16,
                              color: kStarColor,
                            ),
                          ),
                        ),
                        6.toWidth,
                        RichText(
                          textAlign: TextAlign.center,
                          maxLines: 10,
                          text: TextSpan(
                            text: "(",
                            style: defaultTextStyle(
                              color: colorScheme.primary,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(text: "${user.numOfRatings}"),
                              TextSpan(text: ")"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      user.location,
                      style: defaultTextStyle(
                        color: colorScheme.inverseSurface,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          20.toHeight,
          Container(
            height: 90,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: colorScheme.inverseSurface,
                  width: .2,
                ),
              ),
            ),
            child: ListView.separated(
              itemCount: controller.profileInfo.length,
              separatorBuilder: (context, index) => 26.toWidth,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var info = controller.profileInfo[index];
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        info["number"].toString(),
                        style: defaultTextStyle(
                          color: colorScheme.inverseSurface,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        info["title"],
                        style: defaultTextStyle(
                          color: kTextGreyColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 60,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: colorScheme.inverseSurface, width: .2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  maxLines: 10,
                  text: TextSpan(
                    text: "Viewing ",
                    style: defaultTextStyle(
                      color: kTextGreyColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: "Women",
                        style: defaultTextStyle(
                          color: colorScheme.primary,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right, color: kGreyIconColor),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
