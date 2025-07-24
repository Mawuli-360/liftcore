import 'package:liftcore/src/features/onboarding/presentation/state/onboarding_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'onboarding_controller.g.dart';

@riverpod
class OnboardingController extends _$OnboardingController {
  @override
  OnboardingState build() => OnboardingState();

  void nextStep() {
    if (state.currentIndex < state.totalSteps - 1) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    }
  }

  void skip() {
    state = state.copyWith(currentIndex: state.totalSteps - 1);
  }

  bool isOnboardingComplete() => state.currentIndex == state.totalSteps - 1;
}
