import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/shared/theme/app_spacing.dart';
import 'package:liftcore/src/shared/widgets/app_button.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';
import 'package:smooth_corner/smooth_corner.dart';

class SuccessCompletionStepScreen extends StatelessWidget {
  const SuccessCompletionStepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmoothContainer(
            padding: AppSpacing.a32,
            margin: AppSpacing.a24,
            borderRadius: AppSpacing.roundedMd,
            side: BorderSide(color: AppColors.borderColor),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 55,
                    child: Icon(
                      Icons.check_rounded,
                      size: 60,
                      color: Colors.black,
                    ),
                  ),
                  AppSpacing.gapH24,
                  AppText(
                    "Congratulations!",
                    variant: AppTextVariant.headlineLarge,
                    fontWeight: FontWeight.w500,
                  ),
                  AppText(
                    "Your account is successfully created.",
                    variant: AppTextVariant.bodyLarge,
                    // fontWeight: FontWeight.w500,
                  ),
                  AppSpacing.gapH24,
                  AppButton(
                      text: "Start Workout",
                      textColor: Colors.black,
                      size: AppButtonSize.large,
                      width: double.infinity,
                      backgroundColor: AppColors.primaryColor,
                      borderStyle: AppButtonBorderStyle.stadium,
                      onPressed: () {})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
