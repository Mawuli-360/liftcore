import 'package:flutter/material.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/shared/theme/app_spacing.dart';
import 'package:liftcore/src/shared/widgets/app_button.dart';
import 'package:liftcore/src/shared/widgets/app_header.dart';
import 'package:liftcore/src/shared/widgets/app_rich_text.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';
import 'package:smooth_corner/smooth_corner.dart';

class SubscriptionScreen extends StatelessWidget {
  SubscriptionScreen({super.key});

  final subscriptionItems = [
    ("Free", "19.99"),
    ("1 month", "79.99"),
    ("6 months", "1`9.99")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppHeader(title: "Subscription"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppText(
            "Be Premium and Get\nUnlimited Access",
            variant: AppTextVariant.headlineMedium,
            fontWeight: FontWeight.w500,
          ),
          AppText(
            "Enjoy workout access without ads and restrictions",
          ),
          AppSpacing.gapH24,
          Column(
            children: List.generate(subscriptionItems.length, (index) {
              final subscriptionItem = subscriptionItems[index];
              final freemium = index == 0;
              return Container(
                margin: EdgeInsets.only(bottom: AppSpacing.md),
                decoration: ShapeDecoration(
                  shape: SmoothRectangleBorder(
                      side: BorderSide(
                          color: freemium
                              ? AppColors.primaryColor
                              : AppColors.borderColor,
                          width: freemium ? 1 : 0.3),
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: ListTile(
                  leading: Container(
                    height: 20,
                    width: 20,
                    decoration: ShapeDecoration(
                        shape: CircleBorder(
                            side: BorderSide(
                                color: freemium
                                    ? AppColors.primaryColor
                                    : AppColors.borderColor,
                                width: 2))),
                    child: Padding(
                      padding: const EdgeInsets.all(2.5),
                      child: freemium
                          ? CircleAvatar(
                              backgroundColor: AppColors.primaryColor,
                            )
                          : SizedBox.shrink(),
                    ),
                  ),
                  title: AppText(
                    subscriptionItem.$1,
                    variant: AppTextVariant.titleLarge,
                    fontWeight: FontWeight.w600,
                  ),
                  subtitle: AppText("Pay once, cancel any time"),
                  trailing: AppRichText(textSpans: [
                    AppTextSpan(
                        text: "GHC${subscriptionItem.$2}",
                        color: AppColors.primaryColor,
                        isBold: true,
                        fontSize: 16),
                    AppTextSpan(
                      text: "/m",
                      color: const Color(0xA4FFFFFF),
                      isBold: true,
                      fontSize: 14,
                    ),
                  ]),
                ),
              );
            }),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: AppSpacing.lg, left: 16, right: 16),
        child: AppButton(
          text: "Continue",
          textColor: Colors.black,
          size: AppButtonSize.large,
          backgroundColor: AppColors.primaryColor,
          borderStyle: AppButtonBorderStyle.stadium,
          onPressed: () {},
        ),
      ),
    );
  }
}
