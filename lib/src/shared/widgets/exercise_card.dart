import 'package:flutter/material.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/core/constants/app_images.dart';
import 'package:liftcore/src/core/extensions/extensions.dart';
import 'package:liftcore/src/shared/theme/app_spacing.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      side: BorderSide(color: AppColors.borderColor, width: 0.5),
      borderRadius: AppSpacing.roundedLg,
      height: context.screenHeight * 0.18,
      color: Colors.transparent,
      margin: EdgeInsets.only(bottom: context.height10 * 0.2),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: AppSpacing.roundedLg,
              child: Image(
                image: AppImages.chestWorkout,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  "Chest Workout",
                  variant: AppTextVariant.headlineSmall,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  spacing: 7,
                  children: [
                    Expanded(
                      child: Container(
                        height: context.height10 * 0.38,
                        padding: EdgeInsets.only(left: 10),
                        decoration: ShapeDecoration(
                            shape: StadiumBorder(),
                            color: const Color(0xF8333333)),
                        child: Row(
                          spacing: 3,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              color: Colors.white,
                            ),
                            AppText(
                              "10 mins",
                              fontWeight: FontWeight.w600,
                              variant: AppTextVariant.bodyLarge,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: context.height10 * 0.38,
                        padding: EdgeInsets.only(left: 10),
                        decoration: ShapeDecoration(
                            shape: StadiumBorder(),
                            color: const Color(0xF8333333)),
                        child: Row(
                          spacing: 3,
                          children: [
                            Icon(
                              Icons.local_fire_department_outlined,
                              color: Colors.white,
                            ),
                            AppText(
                              "50 kcal",
                              fontWeight: FontWeight.w600,
                              variant: AppTextVariant.bodyLarge,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.primaryColor,
                      child: Center(
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: 38,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
