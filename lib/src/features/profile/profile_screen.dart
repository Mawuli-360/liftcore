import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/core/constants/app_images.dart';
import 'package:liftcore/src/core/router/app_router.dart';
import 'package:liftcore/src/core/router/route_paths.dart';
import 'package:liftcore/src/shared/theme/app_spacing.dart';
import 'package:liftcore/src/shared/widgets/app_header.dart';
import 'package:liftcore/src/shared/widgets/app_rich_text.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final profileItems = [
    "Subscription",
    "App Preference",
    "Connected Device",
    "Security & Help",
  ];

  final List<Map<String, dynamic>> userDescriptions = [
    {"name": "Age", "value": "28 Years"},
    {"name": "Gender", "value": "Male"},
    {"name": "Height", "value": "180 cm"},
    {"name": "Weight", "value": "75 kg"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppHeader(
        title: "Profile",
        isBackButton: false,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Row(spacing: 10, children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AppImages.yoga,
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            "Mawuli Zigah",
                            variant: AppTextVariant.titleMedium,
                            fontWeight: FontWeight.w600,
                          ),
                          GestureDetector(
                            onTap: () =>
                                router.push(RoutePaths.editProfileScreen),
                            child: Icon(
                              Icons.edit_outlined,
                              color: AppColors.white,
                            ),
                          )
                        ],
                      ),
                      AppText(
                        "@mawulizigah",
                        variant: AppTextVariant.titleSmall,
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 3),
                            decoration: ShapeDecoration(
                                shape: StadiumBorder(
                                    side: BorderSide(
                                        color: AppColors.borderColor,
                                        width: 0.5)),
                                color: Colors.transparent),
                            child: AppText(
                              "Intermediate",
                              variant: AppTextVariant.titleSmall,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 3),
                            decoration: ShapeDecoration(
                                shape: StadiumBorder(
                                    side: BorderSide(
                                        color: AppColors.borderColor,
                                        width: 0.5)),
                                color: Colors.transparent),
                            child: AppRichText(
                              textSpans: [
                                AppTextSpan(
                                  text: "Progress",
                                  // color: AppColors.white,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                  fontSize: 13,
                                ),
                                AppTextSpan(
                                  text: " 54%",
                                  color: AppColors.primaryColor,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                  fontSize: 13,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
              )
            ]),
            Divider(
              color: AppColors.borderColor,
              thickness: 0.3,
              height: 30,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(userDescriptions.length, (index) {
                  final title = userDescriptions[index]["name"];
                  final value = userDescriptions[index]["value"];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title,
                        variant: AppTextVariant.titleMedium,
                        fontWeight: FontWeight.w600,
                      ),
                      AppText(
                        value,
                        variant: AppTextVariant.titleSmall,
                      ),
                    ],
                  );
                })),
            Divider(
              color: AppColors.borderColor,
              thickness: 0.3,
              height: 30,
            ),
            Column(
              children: List.generate(profileItems.length, (index) {
                bool isFirstItem = index == 0;
                bool isComingSoon = index > 0;

                return _buildSuffixIcon(
                  title: profileItems[index],
                  isFirstItem: isFirstItem,
                  isComingSoon: isComingSoon,
                );
              }),
            ),
            GestureDetector(
              onTap: null,
              child: Container(
                padding: AppSpacing.a12 * 1.2,
                margin: EdgeInsets.only(bottom: AppSpacing.sm),
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF23C3C),
                  shape: SmoothRectangleBorder(
                    borderRadius: AppSpacing.roundedSm,
                  ),
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                    AppText(
                      "Logout",
                      variant: AppTextVariant.titleMedium,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSuffixIcon(
      {required String title,
      required bool isFirstItem,
      required bool isComingSoon}) {
    return GestureDetector(
        onTap: isFirstItem
            ? () => router.push(RoutePaths.subscriptionScreen)
            : null,
        child: Container(
            padding: AppSpacing.a12 * 1.2,
            margin: EdgeInsets.only(bottom: AppSpacing.sm),
            width: double.infinity,
            decoration: ShapeDecoration(
              shape: SmoothRectangleBorder(
                  borderRadius: AppSpacing.roundedSm,
                  side: BorderSide(color: AppColors.borderColor, width: 0.5)),
            ),
            child: Row(children: [
              AppText(
                title,
                variant: AppTextVariant.titleMedium,
              ),
              Spacer(),
              if (isComingSoon)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: ShapeDecoration(
                      shape: StadiumBorder(),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withAlpha(125),
                          Colors.white.withAlpha(55),
                        ],
                      )),
                  child: AppText(
                    "Coming soon",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              if (isFirstItem)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: ShapeDecoration(
                      shape: StadiumBorder(),
                      gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 206, 181, 19),
                            const Color.fromARGB(255, 218, 202, 101),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Icon(
                    Iconsax.crown1,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
            ])));
  }
}
