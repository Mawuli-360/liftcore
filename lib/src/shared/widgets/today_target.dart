import 'package:flutter/material.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/core/constants/app_images.dart';
import 'package:liftcore/src/core/extensions/extensions.dart';
import 'package:liftcore/src/shared/theme/app_spacing.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';
import 'package:liftcore/src/shared/widgets/dotted_progress.dart';
import 'package:smooth_corner/smooth_corner.dart';

class TodayTarget extends StatelessWidget {
  const TodayTarget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
        side: BorderSide(color: AppColors.borderColor, width: 0.5),
        borderRadius: AppSpacing.roundedLg,
        color: Colors.transparent,
        padding: AppSpacing.a16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                Row(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AppImages.target,
                      height: context.screenHeight * 0.028,
                    ),
                    AppText(
                      "Today Target & Goals",
                      variant: AppTextVariant.bodyLarge,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                AppText(
                  "Muscle Gain",
                  variant: AppTextVariant.headlineSmall,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                DottedCircularProgress(
                  percentage: 50,
                  size: 80,
                  backgroundColor: Colors.grey.shade800,
                  progressColor: AppColors.primaryColor,
                  strokeWidth: 8,
                  segmentCount: 10,
                ),
                AppText(
                  "50%",
                  variant: AppTextVariant.headlineSmall,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                )
              ],
            ),
          ],
        ));
  }
}
