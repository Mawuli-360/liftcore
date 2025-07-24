import 'package:flutter/material.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/core/constants/app_images.dart';
import 'package:liftcore/src/core/extensions/extensions.dart';
import 'package:liftcore/src/core/utils/custom_types.dart';
import 'package:liftcore/src/shared/theme/app_spacing.dart';
import 'package:liftcore/src/shared/widgets/app_header.dart';
import 'package:liftcore/src/shared/widgets/app_rich_text.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';
import 'package:liftcore/src/shared/widgets/today_target.dart';
import 'package:smooth_corner/smooth_corner.dart';

class InsightScreen extends StatelessWidget {
  InsightScreen({super.key});

  final List<InsightProgressData> insightProgressDatas = [
    (
      image: AppImages.calorie,
      title: "Calories",
      value: "1.230",
      unit: " kcal",
      color: const Color(0xFFDB44E0),
    ),
    (
      image: AppImages.step,
      title: "Steps",
      value: "9485",
      unit: " kcal",
      color: const Color(0xFF3D6AF4)
    ),
    (
      image: AppImages.heart,
      title: "Heart Beats",
      value: "73",
      unit: " Bpm",
      color: Colors.red,
    ),
    (
      image: AppImages.dumbbell,
      title: "Workouts",
      value: "14",
      unit: " /20",
      color: AppColors.primaryColor
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppHeader(
        title: "Insight",
        isBackButton: false,
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TodayTarget(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              children: List.generate(4, (index) {
                final data = insightProgressDatas[index];
                return _InsightProgressItem(
                  title: data.title,
                  value: data.value,
                  unit: data.unit,
                  image: data.image,
                  color: data.color,
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

class _InsightProgressItem extends StatelessWidget {
  const _InsightProgressItem(
      {required this.title,
      required this.value,
      required this.unit,
      required this.image,
      required this.color});

  final String title;
  final String value;
  final String unit;
  final AssetImage image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (context.screenWidth - 36) / 2,
      child: SmoothContainer(
        side: BorderSide(color: AppColors.borderColor, width: 0.5),
        borderRadius: AppSpacing.roundedLg,
        color: Colors.transparent,
        padding: AppSpacing.a12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 8,
              children: [
                Image(
                  image: image,
                  height: context.screenHeight * 0.025,
                ),
                Expanded(
                  // Add Expanded to prevent overflow
                  child: AppText(
                    title,
                    variant: AppTextVariant.bodyLarge,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8), // Add some spacing
            AppRichText(textSpans: [
              AppTextSpan(
                  text: value, isBold: true, color: color, fontSize: 28),
              AppTextSpan(
                text: unit,
                color: Colors.white,
                fontSize: 16,
              )
            ])
          ],
        ),
      ),
    );
  }
}
