import 'package:flutter/material.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/shared/widgets/app_button.dart';

class OnboardingNavs extends StatelessWidget {
  const OnboardingNavs({
    super.key,
    required this.isComplete,
    required this.onGetStarted,
    required this.onSkip,
    required this.onNext,
  });

  final bool isComplete;
  final VoidCallback onGetStarted;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: isComplete
          ? AppButton(
              text: "Get Started",
              textColor: Colors.black,
              backgroundColor: AppColors.primaryColor,
              borderStyle: AppButtonBorderStyle.stadium,
              onPressed: onGetStarted)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Expanded(
                    child: AppButton(
                        text: "Skip",
                        backgroundColor: AppColors.white,
                        textColor: Colors.black,
                        borderStyle: AppButtonBorderStyle.stadium,
                        onPressed: onSkip)),
                Expanded(
                  flex: 3,
                  child: AppButton(
                      text: "Next",
                      textColor: Colors.black,
                      backgroundColor: AppColors.primaryColor,
                      borderStyle: AppButtonBorderStyle.stadium,
                      onPressed: onNext),
                ),
              ],
            ),
    );
  }
}
