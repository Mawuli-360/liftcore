import 'package:freezed_annotation/freezed_annotation.dart';
part 'onboarding_state.freezed.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    @Default(0) int currentIndex,
    @Default(3) int totalSteps,
    @Default(false) bool canGoNext,
    @Default(false) bool canGoBack,
  }) = _OnboardingState;
}
