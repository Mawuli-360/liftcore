import 'package:flutter/material.dart';

/// A utility class that provides reusable decorations like box shadows, borders, and gradients
class AppDecoration {
  AppDecoration._();

  /// Soft shadow for subtle elevation
  static List<BoxShadow> get softShadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ];

  /// Medium shadow for cards and elevated surfaces
  static List<BoxShadow> get mediumShadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.08),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ];

  /// Strong shadow for modals and floating elements
  static List<BoxShadow> get strongShadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.12),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.08),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ];

  /// Layered shadow for more depth
  static List<BoxShadow> get layeredShadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 24,
          offset: const Offset(0, 8),
        ),
      ];

  /// Colored shadow (can be used with brand colors)
  static List<BoxShadow> coloredShadow(Color color) => [
        BoxShadow(
          color: color.withValues(alpha: 0.25),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ];

  /// Inner shadow effect (simulated)
  static BoxDecoration innerShadowDecoration({
    Color? color,
    double borderRadius = 12,
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 4,
          spreadRadius: -3,
        ),
      ],
    );
  }

  /// Card decoration with shadow
  static BoxDecoration cardDecoration({
    Color? color,
    double borderRadius = 12,
    List<BoxShadow>? boxShadow,
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: boxShadow ?? softShadow,
    );
  }

  /// Gradient decoration
  static BoxDecoration gradientDecoration({
    required List<Color> colors,
    double borderRadius = 12,
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
  }) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: begin,
        end: end,
        colors: colors,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  /// Border decoration
  static BoxDecoration borderDecoration({
    Color? color,
    double borderRadius = 12,
    double borderWidth = 1,
    Color? borderColor,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: borderColor ?? Colors.grey.withValues(alpha: 0.2),
        width: borderWidth,
      ),
    );
  }

  /// Glass effect decoration
  static BoxDecoration glassDecoration({
    double borderRadius = 12,
    double opacity = 0.1,
  }) {
    return BoxDecoration(
      color: Colors.white.withValues(alpha: opacity),
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: Colors.white.withValues(alpha: 0.2),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 8,
          spreadRadius: -4,
        ),
      ],
    );
  }

  /// Concave effect decoration
  static BoxDecoration concaveDecoration({
    Color? color,
    double borderRadius = 12,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      color: color ?? Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.white.withValues(alpha: 0.5),
          offset: const Offset(-4, -4),
          blurRadius: 8,
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          offset: const Offset(4, 4),
          blurRadius: 8,
        ),
      ],
    );
  }

  /// Convex effect decoration
  static BoxDecoration convexDecoration({
    Color? color,
    double borderRadius = 12,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          (color ?? Colors.white).lighten(0.1),
          (color ?? Colors.white).darken(0.1),
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 8,
          offset: const Offset(4, 4),
        ),
      ],
    );
  }
}

/// Extension methods for Color to lighten and darken
extension ColorExtension on Color {
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }
}
