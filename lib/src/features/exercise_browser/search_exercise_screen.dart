import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/core/constants/app_images.dart';
import 'package:liftcore/src/core/extensions/extensions.dart';
import 'package:liftcore/src/core/router/app_router.dart';
import 'package:liftcore/src/core/router/route_paths.dart';
import 'package:liftcore/src/shared/theme/app_spacing.dart';
import 'package:liftcore/src/shared/widgets/app_button.dart';
import 'package:liftcore/src/shared/widgets/app_form_field.dart';
import 'package:liftcore/src/shared/widgets/app_header.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';
import 'package:smooth_corner/smooth_corner.dart';

class SearchExerciseScreen extends StatelessWidget {
  SearchExerciseScreen({super.key});

  final List<String> popularWorkouts = [
    "Cardio",
    "Yoga",
    "Functional Training",
    "CrossFit",
    "Full-Body Workouts"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppHeader(
        title: "Search",
        isBackButton: false,
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: context.screenHeight * 0.06,
            child: AppFormField(
                fillColor: Colors.transparent,
                hint: "Search something...",
                style: TextStyle(color: AppColors.white, fontSize: 16),
                prefixIcon: Icon(
                  Iconsax.search_normal_14,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(30),
                )),
          ),
          AppSpacing.gapH12,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                "Recent Search",
                variant: AppTextVariant.headlineSmall,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),

          // not found animation
          // Lottie.asset(AppAnimations.notFound, height: 200),

          // when result is found

          Container(
            padding: const EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(vertical: 12),
            decoration: ShapeDecoration(
              shape: SmoothRectangleBorder(
                  borderRadius: AppSpacing.roundedMd,
                  side: BorderSide(color: AppColors.borderColor, width: 0.5)),
            ),
            child: Column(
              children: List.generate(
                  4,
                  (index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Iconsax.refresh,
                                  color: Colors.white54,
                                  size: 20,
                                ),
                                AppSpacing.gapW8,
                                AppText(
                                  "No recent search found",
                                  variant: AppTextVariant.bodyLarge,
                                  color: Colors.white70,
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.red,
                          )
                        ],
                      )),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                "Popular Workout",
                variant: AppTextVariant.headlineSmall,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          AppSpacing.gapH12,

          Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(popularWorkouts.length, (index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(
                        side: BorderSide(
                            width: 0.5, color: AppColors.borderColor)),
                  ),
                  child: AppText(
                    popularWorkouts[index],
                  ),
                );
              })),
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
                onPressed: () => router.push(RoutePaths.exerciseCategoryScreen),
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
        ],
      ),
    );
  }
}
