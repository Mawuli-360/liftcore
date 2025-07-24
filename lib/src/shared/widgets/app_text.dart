import 'package:flutter/material.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';

enum AppTextVariant {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

class AppText extends StatelessWidget {
  final String text;
  final AppTextVariant variant;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool selectable;
  final TextDecoration? decoration;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;

  const AppText(
    this.text, {
    super.key,
    this.variant = AppTextVariant.bodyMedium,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.selectable = false,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontWeight,
    this.fontStyle,
  });

  const AppText.displayLarge(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.selectable = false,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontWeight,
    this.fontStyle,
  }) : variant = AppTextVariant.displayLarge;

  const AppText.displayMedium(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.selectable = false,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontWeight,
    this.fontStyle,
  }) : variant = AppTextVariant.displayMedium;

  const AppText.displaySmall(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.selectable = false,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontWeight,
    this.fontStyle,
  }) : variant = AppTextVariant.displaySmall;

  const AppText.headlineLarge(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.selectable = false,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontWeight,
    this.fontStyle,
  }) : variant = AppTextVariant.headlineLarge;

  const AppText.headlineMedium(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.selectable = false,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontWeight,
    this.fontStyle,
  }) : variant = AppTextVariant.headlineMedium;

  const AppText.headlineSmall(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.selectable = false,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontWeight,
    this.fontStyle,
  }) : variant = AppTextVariant.headlineSmall;

  const AppText.titleLarge(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.selectable = false,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontWeight,
    this.fontStyle,
  }) : variant = AppTextVariant.titleLarge;

  const AppText.titleMedium(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.selectable = false,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontWeight,
    this.fontStyle,
  }) : variant = AppTextVariant.titleMedium;

  const AppText.titleSmall(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.selectable = false,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontWeight,
    this.fontStyle,
  }) : variant = AppTextVariant.titleSmall;

  const AppText.bodyLarge(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.selectable = false,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontWeight,
    this.fontStyle,
  }) : variant = AppTextVariant.bodyLarge;

  const AppText.bodyMedium(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.selectable = false,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontWeight,
    this.fontStyle,
  }) : variant = AppTextVariant.bodyMedium;

  const AppText.bodySmall(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.selectable = false,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontWeight,
    this.fontStyle,
  }) : variant = AppTextVariant.bodySmall;

  const AppText.labelLarge(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.selectable = false,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontWeight,
    this.fontStyle,
  }) : variant = AppTextVariant.labelLarge;

  const AppText.labelMedium(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.selectable = false,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontWeight,
    this.fontStyle,
  }) : variant = AppTextVariant.labelMedium;

  const AppText.labelSmall(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.selectable = false,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fontWeight,
    this.fontStyle,
  }) : variant = AppTextVariant.labelSmall;

  TextStyle _getTextStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    TextStyle style;

    switch (variant) {
      case AppTextVariant.displayLarge:
        style = textTheme.displayLarge!;
      case AppTextVariant.displayMedium:
        style = textTheme.displayMedium!;
      case AppTextVariant.displaySmall:
        style = textTheme.displaySmall!;
      case AppTextVariant.headlineLarge:
        style = textTheme.headlineLarge!;
      case AppTextVariant.headlineMedium:
        style = textTheme.headlineMedium!;
      case AppTextVariant.headlineSmall:
        style = textTheme.headlineSmall!;
      case AppTextVariant.titleLarge:
        style = textTheme.titleLarge!;
      case AppTextVariant.titleMedium:
        style = textTheme.titleMedium!;
      case AppTextVariant.titleSmall:
        style = textTheme.titleSmall!;
      case AppTextVariant.bodyLarge:
        style = textTheme.bodyLarge!;
      case AppTextVariant.bodyMedium:
        style = textTheme.bodyMedium!;
      case AppTextVariant.bodySmall:
        style = textTheme.bodySmall!;
      case AppTextVariant.labelLarge:
        style = textTheme.labelLarge!;
      case AppTextVariant.labelMedium:
        style = textTheme.labelMedium!;
      case AppTextVariant.labelSmall:
        style = textTheme.labelSmall!;
    }

    return style.copyWith(
      color: color ?? AppColors.white,
      decoration: decoration,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = _getTextStyle(context);

    final textWidget = Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );

    return selectable ? SelectableText(text, style: style) : textWidget;
  }
}
