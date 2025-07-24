// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OnboardingState {
  int get currentIndex;
  int get totalSteps;
  bool get canGoNext;
  bool get canGoBack;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      _$OnboardingStateCopyWithImpl<OnboardingState>(
          this as OnboardingState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnboardingState &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.totalSteps, totalSteps) ||
                other.totalSteps == totalSteps) &&
            (identical(other.canGoNext, canGoNext) ||
                other.canGoNext == canGoNext) &&
            (identical(other.canGoBack, canGoBack) ||
                other.canGoBack == canGoBack));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentIndex, totalSteps, canGoNext, canGoBack);

  @override
  String toString() {
    return 'OnboardingState(currentIndex: $currentIndex, totalSteps: $totalSteps, canGoNext: $canGoNext, canGoBack: $canGoBack)';
  }
}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) _then) =
      _$OnboardingStateCopyWithImpl;
  @useResult
  $Res call({int currentIndex, int totalSteps, bool canGoNext, bool canGoBack});
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? totalSteps = null,
    Object? canGoNext = null,
    Object? canGoBack = null,
  }) {
    return _then(_self.copyWith(
      currentIndex: null == currentIndex
          ? _self.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      totalSteps: null == totalSteps
          ? _self.totalSteps
          : totalSteps // ignore: cast_nullable_to_non_nullable
              as int,
      canGoNext: null == canGoNext
          ? _self.canGoNext
          : canGoNext // ignore: cast_nullable_to_non_nullable
              as bool,
      canGoBack: null == canGoBack
          ? _self.canGoBack
          : canGoBack // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _OnboardingState implements OnboardingState {
  _OnboardingState(
      {this.currentIndex = 0,
      this.totalSteps = 3,
      this.canGoNext = false,
      this.canGoBack = false});

  @override
  @JsonKey()
  final int currentIndex;
  @override
  @JsonKey()
  final int totalSteps;
  @override
  @JsonKey()
  final bool canGoNext;
  @override
  @JsonKey()
  final bool canGoBack;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OnboardingStateCopyWith<_OnboardingState> get copyWith =>
      __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnboardingState &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.totalSteps, totalSteps) ||
                other.totalSteps == totalSteps) &&
            (identical(other.canGoNext, canGoNext) ||
                other.canGoNext == canGoNext) &&
            (identical(other.canGoBack, canGoBack) ||
                other.canGoBack == canGoBack));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentIndex, totalSteps, canGoNext, canGoBack);

  @override
  String toString() {
    return 'OnboardingState(currentIndex: $currentIndex, totalSteps: $totalSteps, canGoNext: $canGoNext, canGoBack: $canGoBack)';
  }
}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(
          _OnboardingState value, $Res Function(_OnboardingState) _then) =
      __$OnboardingStateCopyWithImpl;
  @override
  @useResult
  $Res call({int currentIndex, int totalSteps, bool canGoNext, bool canGoBack});
}

/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentIndex = null,
    Object? totalSteps = null,
    Object? canGoNext = null,
    Object? canGoBack = null,
  }) {
    return _then(_OnboardingState(
      currentIndex: null == currentIndex
          ? _self.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      totalSteps: null == totalSteps
          ? _self.totalSteps
          : totalSteps // ignore: cast_nullable_to_non_nullable
              as int,
      canGoNext: null == canGoNext
          ? _self.canGoNext
          : canGoNext // ignore: cast_nullable_to_non_nullable
              as bool,
      canGoBack: null == canGoBack
          ? _self.canGoBack
          : canGoBack // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
