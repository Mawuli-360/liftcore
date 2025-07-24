import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/core/constants/app_images.dart';
import 'package:liftcore/src/core/extensions/extensions.dart';
import 'package:liftcore/src/core/router/app_router.dart';
import 'package:liftcore/src/core/router/route_paths.dart';
import 'package:liftcore/src/shared/theme/app_spacing.dart';
import 'package:liftcore/src/shared/widgets/app_button.dart';
import 'package:liftcore/src/shared/widgets/app_rich_text.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';
import 'package:liftcore/src/shared/widgets/exercise_card.dart';
import 'package:liftcore/src/shared/widgets/today_target.dart';
import 'package:smooth_corner/smooth_corner.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          // Add physics for better scrolling behavior
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Add some top padding
              const SizedBox(height: 16),

              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          "Good Afternoon,",
                          variant: AppTextVariant.headlineMedium,
                          fontWeight: FontWeight.bold,
                        ),
                        AppText(
                          "Alex!",
                          variant: AppTextVariant.headlineSmall,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AppImages.yoga,
                    )
                  ],
                ),
              ),
              AppSpacing.gapH24,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "Daily Task",
                    variant: AppTextVariant.headlineSmall,
                    fontWeight: FontWeight.w600,
                  ),
                  AppButton(
                    text: "See More",
                    backgroundColor: Colors.transparent,
                    textColor: Colors.white70,
                    onPressed: () => router.push(RoutePaths.dailyTaskScreen),
                    icon: Icons.arrow_forward_ios,
                    iconPosition: IconPosition.end,
                    iconColor: AppColors.primaryColor,
                    iconSize: 13,
                  ),
                ],
              ),
              AppSpacing.gapH12,

              /// Daily Task Item
              ExerciseCard(),

              AppSpacing.gapH12,

              /// today target
              TodayTarget(),
              AppSpacing.gapH12,
              Row(
                spacing: 12,
                children: [
                  Expanded(
                    child: SmoothContainer(
                      side:
                          BorderSide(color: AppColors.borderColor, width: 0.5),
                      borderRadius: AppSpacing.roundedLg,
                      color: Colors.transparent,
                      padding: AppSpacing.a12,
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 8,
                            children: [
                              Image(
                                image: AppImages.timer,
                                height: context.screenHeight * 0.025,
                              ),
                              AppText(
                                "Time",
                                variant: AppTextVariant.bodyLarge,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          AppRichText(textSpans: [
                            AppTextSpan(
                                text: "1:30",
                                isBold: true,
                                color: Colors.white,
                                fontSize: 28),
                            AppTextSpan(
                              text: " HR",
                              color: Colors.white,
                              fontSize: 16,
                            )
                          ])
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SmoothContainer(
                      side:
                          BorderSide(color: AppColors.borderColor, width: 0.5),
                      borderRadius: AppSpacing.roundedLg,
                      color: Colors.transparent,
                      padding: AppSpacing.a12,
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 8,
                            children: [
                              Image(
                                image: AppImages.calorie,
                                height: context.screenHeight * 0.025,
                              ),
                              AppText(
                                "Calories Burns",
                                variant: AppTextVariant.bodyLarge,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          AppRichText(textSpans: [
                            AppTextSpan(
                                text: "1.230",
                                isBold: true,
                                color: Colors.white,
                                fontSize: 28),
                            AppTextSpan(
                              text: " Kcal",
                              color: Colors.white,
                              fontSize: 16,
                            )
                          ])
                        ],
                      ),
                    ),
                  )
                ],
              ),

              /// Categories
              AppSpacing.gapH12,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "Categories",
                    variant: AppTextVariant.headlineSmall,
                    fontWeight: FontWeight.w600,
                  ),
                  AppButton(
                    text: "See More",
                    backgroundColor: Colors.transparent,
                    textColor: Colors.white70,
                    onPressed: () =>
                        router.push(RoutePaths.exerciseCategoryScreen),
                    icon: Icons.arrow_forward_ios,
                    iconPosition: IconPosition.end,
                    iconColor: AppColors.primaryColor,
                    iconSize: 13,
                  ),
                ],
              ),

              /// Categories item
              AppSpacing.gapH12,
              SizedBox(
                height: context.screenHeight * 0.18,
                child: ListView.separated(
                    // Disable nested scrolling conflicts
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: context.screenHeight * 0.18,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                                image: AppImages.backUp, fit: BoxFit.cover),
                            borderRadius: AppSpacing.roundedMd,
                            border: Border.all(
                                color: AppColors.borderColor, width: 0.5)),
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Align(
                          alignment: const Alignment(-0.5, 1),
                          child: AppText(
                            "Muscle Gain",
                            variant: AppTextVariant.titleMedium,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemCount: 6),
              ),

              // Add bottom padding to ensure content doesn't get cut off
              SizedBox(height: context.screenHeight * 0.09),
            ],
          ),
        ),
      ),
    );
  }
}
