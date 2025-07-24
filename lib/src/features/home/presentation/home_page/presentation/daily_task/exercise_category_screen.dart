import 'package:flutter/material.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/core/constants/app_images.dart';
import 'package:liftcore/src/core/extensions/extensions.dart';
import 'package:liftcore/src/shared/theme/app_spacing.dart';
import 'package:liftcore/src/shared/widgets/app_header.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ExerciseCategoryScreen extends StatelessWidget {
  const ExerciseCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppHeader(title: "Categories"),
      body: Expanded(
        child: GridView.builder(
            padding: EdgeInsets.only(bottom: AppSpacing.xl),
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  image: DecorationImage(
                      image: AppImages.chestWorkout, fit: BoxFit.cover),
                  color: AppColors.white,
                  shape:
                      SmoothRectangleBorder(borderRadius: AppSpacing.roundedMd),
                ),
                child: Align(
                  alignment: Alignment(-0.8, 0.9),
                  child: AppText(
                    "Strength",
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    variant: AppTextVariant.values[6],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
