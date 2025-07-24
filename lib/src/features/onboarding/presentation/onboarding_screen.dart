import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liftcore/src/core/constants/app_images.dart';
import 'package:liftcore/src/core/extensions/extensions.dart';
import 'package:liftcore/src/core/utils/custom_types.dart';
import 'package:liftcore/src/features/onboarding/presentation/controller/onboarding_controller.dart';
import 'package:liftcore/src/features/onboarding/presentation/widgets/onboarding_content.dart';

class OnboardingScreen extends ConsumerWidget {
  OnboardingScreen({super.key});
  final List<OnboardingStep> steps = [
    (
      image: AppImages.backUp,
      title: "Workouts Designed\nJust for You!",
      description:
          "Get a customized fitness plan tailored to your\ngoals, fitness level, and preferences-achieve\nresults faster"
    ),
    (
      image: AppImages.pullUp,
      title: "Track Every Rep,\nCelebrate Every Win!",
      description:
          "Monitor your progress with detailed analytics\nand smart insights-stay motivated with\nreal-time achievements and milestones"
    ),
    (
      image: AppImages.chestExercise,
      title: "Your Personal Trainer\nin Your Pocket!",
      description:
          "Access expert guidance anytime, anywhere with\nvideo demonstrations, form corrections, and\npersonalized coaching tips"
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingControllerProvider);
    final controller = ref.read(onboardingControllerProvider.notifier);
    final step = steps[state.currentIndex];

    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(step.image),
          _buildBottomOverlay(context),
          OnboardingContent(
            onSkip: () => controller.skip(),
            onNext: () => controller.nextStep(),
            onGetStarted: () {},
            isComplete: controller.isOnboardingComplete(),
            currentIndex: state.currentIndex,
            totalSteps: state.totalSteps,
            title: step.title,
            description: step.description,
          )
        ],
      ),
    );
  }

  Widget _buildBackgroundImage(ImageProvider image) {
    return Positioned.fill(
        child: Image(
      image: image,
      fit: BoxFit.cover,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 700),
          child: child,
        );
      },
    ));
  }

  Widget _buildBottomOverlay(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
            height: context.screenHeight * 0.35,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              const Color(0xA9000000),
              const Color(0x63000000),
              Colors.transparent
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter))));
  }
}
