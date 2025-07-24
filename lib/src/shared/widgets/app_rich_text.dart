import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// A custom rich text widget that provides an easy way to create and style text spans
class AppRichText extends StatelessWidget {
  final List<AppTextSpan> textSpans;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int? maxLines;

  const AppRichText({
    super.key,
    required this.textSpans,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: textSpans.map((span) => span.build(context)).toList(),
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}

/// A builder class for creating customized text spans
class AppTextSpan {
  final String text;
  final TextStyle? style;
  final VoidCallback? onTap;
  final bool isLink;
  final bool isBold;
  final bool isItalic;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final TextDecoration? decoration;

  AppTextSpan({
    required this.text,
    this.style,
    this.onTap,
    this.isLink = false,
    this.isBold = false,
    this.isItalic = false,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.decoration,
  });

  TextSpan build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    TextStyle computedStyle =
        style ?? theme.textTheme.bodyMedium ?? const TextStyle();

    if (isBold) {
      computedStyle = computedStyle.copyWith(fontWeight: FontWeight.bold);
    }

    if (isItalic) {
      computedStyle = computedStyle.copyWith(fontStyle: FontStyle.italic);
    }

    if (color != null) {
      computedStyle = computedStyle.copyWith(color: color);
    }

    if (fontSize != null) {
      computedStyle = computedStyle.copyWith(fontSize: fontSize);
    }

    if (fontFamily != null) {
      computedStyle = computedStyle.copyWith(fontFamily: fontFamily);
    }

    if (decoration != null) {
      computedStyle = computedStyle.copyWith(decoration: decoration);
    }

    if (isLink) {
      computedStyle = computedStyle.copyWith(
        color: theme.primaryColor,
        decoration: TextDecoration.underline,
      );
    }

    return TextSpan(
      text: text,
      style: computedStyle,
      recognizer:
          onTap != null ? (TapGestureRecognizer()..onTap = onTap) : null,
    );
  }
}

/// Extension method to create rich text from a list of text spans
extension RichTextExtension on List<AppTextSpan> {
  AppRichText toRichText({
    TextAlign textAlign = TextAlign.start,
    TextOverflow overflow = TextOverflow.clip,
    int? maxLines,
  }) {
    return AppRichText(
      textSpans: this,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
