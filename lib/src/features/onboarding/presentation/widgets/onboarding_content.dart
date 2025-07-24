import 'package:flutter/material.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/core/utils/app_logger.dart';
import 'package:liftcore/src/features/onboarding/presentation/widgets/onboarding_navs.dart';
import 'package:liftcore/src/shared/theme/app_spacing.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.onSkip,
    required this.onNext,
    required this.onGetStarted,
    required this.isComplete,
    required this.currentIndex,
    required this.totalSteps,
    required this.title,
    required this.description,
  });

  final VoidCallback onSkip;
  final VoidCallback onNext;
  final VoidCallback onGetStarted;
  final bool isComplete;
  final int currentIndex;
  final int totalSteps;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildContent(),
        _buildIndicator(),
        AppSpacing.gapH16,
        OnboardingNavs(
            isComplete: isComplete,
            onGetStarted: onGetStarted,
            onSkip: onSkip,
            onNext: onNext),
        AppSpacing.gapH32
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        AppText(
          title,
          textAlign: TextAlign.center,
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          variant: AppTextVariant.displaySmall,
        ),
        AppText(
          description,
          textAlign: TextAlign.center,
          color: AppColors.white,
          variant: AppTextVariant.bodyLarge,
        ),
        AppSpacing.gapH16,
      ],
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12,
      children: List.generate(totalSteps, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: index == currentIndex ? 10 : 8,
          height: index == currentIndex ? 10 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentIndex
                ? AppColors.primaryColor
                : AppColors.white,
          ),
        );
      }),
    );
  }
}
