import 'package:flutter/material.dart';

/// A utility class that provides reusable spacing constants throughout the app
class AppSpacing {
  AppSpacing._();

  /// Spacing values (in logical pixels) for consistent spacing throughout the app
  static const double zero = 0;
  static const double xxxs = 2;
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 40;
  static const double xxxl = 48;
  static const double huge = 56;
  static const double giant = 64;

  /// Padding presets
  static const EdgeInsets none = EdgeInsets.zero;

  /// All side padding
  static const EdgeInsets a2 = EdgeInsets.all(xxxs);
  static const EdgeInsets a4 = EdgeInsets.all(xxs);
  static const EdgeInsets a8 = EdgeInsets.all(xs);
  static const EdgeInsets a12 = EdgeInsets.all(sm);
  static const EdgeInsets a16 = EdgeInsets.all(md);
  static const EdgeInsets a24 = EdgeInsets.all(lg);
  static const EdgeInsets a32 = EdgeInsets.all(xl);

  /// Horizontal padding
  static const EdgeInsets h2 = EdgeInsets.symmetric(horizontal: xxxs);
  static const EdgeInsets h4 = EdgeInsets.symmetric(horizontal: xxs);
  static const EdgeInsets h8 = EdgeInsets.symmetric(horizontal: xs);
  static const EdgeInsets h12 = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets h16 = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets h24 = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets h32 = EdgeInsets.symmetric(horizontal: xl);

  /// Vertical padding
  static const EdgeInsets v2 = EdgeInsets.symmetric(vertical: xxxs);
  static const EdgeInsets v4 = EdgeInsets.symmetric(vertical: xxs);
  static const EdgeInsets v8 = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets v12 = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets v16 = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets v24 = EdgeInsets.symmetric(vertical: lg);
  static const EdgeInsets v32 = EdgeInsets.symmetric(vertical: xl);

  /// Specific side padding
  static const EdgeInsets t2 = EdgeInsets.only(top: xxxs);
  static const EdgeInsets t4 = EdgeInsets.only(top: xxs);
  static const EdgeInsets t8 = EdgeInsets.only(top: xs);
  static const EdgeInsets t12 = EdgeInsets.only(top: sm);
  static const EdgeInsets t16 = EdgeInsets.only(top: md);
  static const EdgeInsets t24 = EdgeInsets.only(top: lg);
  static const EdgeInsets t32 = EdgeInsets.only(top: xl);

  static const EdgeInsets r2 = EdgeInsets.only(right: xxxs);
  static const EdgeInsets r4 = EdgeInsets.only(right: xxs);
  static const EdgeInsets r8 = EdgeInsets.only(right: xs);
  static const EdgeInsets r12 = EdgeInsets.only(right: sm);
  static const EdgeInsets r16 = EdgeInsets.only(right: md);
  static const EdgeInsets r24 = EdgeInsets.only(right: lg);
  static const EdgeInsets r32 = EdgeInsets.only(right: xl);

  static const EdgeInsets b2 = EdgeInsets.only(bottom: xxxs);
  static const EdgeInsets b4 = EdgeInsets.only(bottom: xxs);
  static const EdgeInsets b8 = EdgeInsets.only(bottom: xs);
  static const EdgeInsets b12 = EdgeInsets.only(bottom: sm);
  static const EdgeInsets b16 = EdgeInsets.only(bottom: md);
  static const EdgeInsets b24 = EdgeInsets.only(bottom: lg);
  static const EdgeInsets b32 = EdgeInsets.only(bottom: xl);

  static const EdgeInsets l2 = EdgeInsets.only(left: xxxs);
  static const EdgeInsets l4 = EdgeInsets.only(left: xxs);
  static const EdgeInsets l8 = EdgeInsets.only(left: xs);
  static const EdgeInsets l12 = EdgeInsets.only(left: sm);
  static const EdgeInsets l16 = EdgeInsets.only(left: md);
  static const EdgeInsets l24 = EdgeInsets.only(left: lg);
  static const EdgeInsets l32 = EdgeInsets.only(left: xl);

  /// Gap widgets for adding space between widgets in rows/columns
  static const SizedBox gapW2 = SizedBox(width: xxxs);
  static const SizedBox gapW4 = SizedBox(width: xxs);
  static const SizedBox gapW8 = SizedBox(width: xs);
  static const SizedBox gapW12 = SizedBox(width: sm);
  static const SizedBox gapW16 = SizedBox(width: md);
  static const SizedBox gapW24 = SizedBox(width: lg);
  static const SizedBox gapW32 = SizedBox(width: xl);

  static const SizedBox gapH2 = SizedBox(height: xxxs);
  static const SizedBox gapH4 = SizedBox(height: xxs);
  static const SizedBox gapH8 = SizedBox(height: xs);
  static const SizedBox gapH12 = SizedBox(height: sm);
  static const SizedBox gapH16 = SizedBox(height: md);
  static const SizedBox gapH24 = SizedBox(height: lg);
  static const SizedBox gapH32 = SizedBox(height: xl);

  /// Border radius values
  static const double radiusXxs = 4;
  static const double radiusXs = 8;
  static const double radiusSm = 12;
  static const double radiusMd = 16;
  static const double radiusLg = 20;
  static const double radiusXl = 24;
  static const double radiusXxl = 32;
  static const double radiusCircular = 999;

  /// Common border radius
  static final BorderRadius roundedNone = BorderRadius.circular(zero);
  static final BorderRadius roundedXxs = BorderRadius.circular(radiusXxs);
  static final BorderRadius roundedXs = BorderRadius.circular(radiusXs);
  static final BorderRadius roundedSm = BorderRadius.circular(radiusSm);
  static final BorderRadius roundedMd = BorderRadius.circular(radiusMd);
  static final BorderRadius roundedLg = BorderRadius.circular(radiusLg);
  static final BorderRadius roundedXl = BorderRadius.circular(radiusXl);
  static final BorderRadius roundedXxl = BorderRadius.circular(radiusXxl);
  static final BorderRadius roundedFull = BorderRadius.circular(radiusCircular);
}
