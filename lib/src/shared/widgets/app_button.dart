import 'package:flutter/material.dart';

enum AppButtonSize { small, medium, large }

enum IconPosition { start, end }

enum AppButtonBorderStyle {
  none, // No border radius
  rounded, // Regular rounded corners
  stadium // Stadium border (fully rounded)
}

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final IconPosition iconPosition;
  final AppButtonSize size;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? disabledBackgroundColor;
  final Color? disabledTextColor;
  final bool isOutlined;
  final double? width;
  final AppButtonBorderStyle borderStyle;
  final double? borderRadius;
  final double? iconSize;
  final Color? iconColor;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.iconPosition = IconPosition.start,
    this.size = AppButtonSize.medium,
    this.backgroundColor,
    this.textColor,
    this.disabledBackgroundColor,
    this.disabledTextColor,
    this.isOutlined = false,
    this.width,
    this.borderStyle = AppButtonBorderStyle.rounded,
    this.borderRadius = 8,
    this.iconSize,
    this.iconColor,
  });

  BorderRadius? _getBorderRadius() {
    switch (borderStyle) {
      case AppButtonBorderStyle.none:
        return null;
      case AppButtonBorderStyle.rounded:
        return BorderRadius.circular(borderRadius ?? 8);
      case AppButtonBorderStyle.stadium:
        return BorderRadius.circular(
            100); // Large enough to create stadium effect
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDisabled = onPressed == null && !isLoading;

    final buttonStyle = isOutlined
        ? OutlinedButton.styleFrom(
            foregroundColor: isDisabled
                ? (disabledTextColor ?? theme.disabledColor)
                : (textColor ?? colorScheme.primary),
            side: BorderSide(
              color: isDisabled
                  ? (disabledBackgroundColor ?? theme.disabledColor)
                  : (backgroundColor ?? colorScheme.primary),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: _getBorderRadius() ?? BorderRadius.zero,
            ),
            disabledForegroundColor: disabledTextColor ?? theme.disabledColor,
          )
        : ElevatedButton.styleFrom(
            backgroundColor: isDisabled
                ? (disabledBackgroundColor ?? theme.disabledColor)
                : (backgroundColor ?? colorScheme.primary),
            foregroundColor: isDisabled
                ? (disabledTextColor ?? colorScheme.onSurface)
                : (textColor ?? colorScheme.onPrimary),
            shape: RoundedRectangleBorder(
              borderRadius: _getBorderRadius() ?? BorderRadius.zero,
            ),
            disabledBackgroundColor:
                disabledBackgroundColor ?? theme.disabledColor,
            disabledForegroundColor: disabledTextColor ??
                colorScheme.onSurface.withValues(alpha: 0.38),
          );

    final buttonSize = _getButtonSize(size);
    final buttonHeight = buttonSize.height;
    final buttonPadding = buttonSize.padding;
    final fontSize = buttonSize.fontSize;

    final child = isLoading
        ? SizedBox(
            height: fontSize,
            width: fontSize,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                isOutlined ? colorScheme.primary : colorScheme.onPrimary,
              ),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null && iconPosition == IconPosition.start) ...[
                Icon(icon, size: iconSize, color: iconColor),
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: TextStyle(fontSize: fontSize),
              ),
              if (icon != null && iconPosition == IconPosition.end) ...[
                const SizedBox(width: 8),
                Icon(icon, size: iconSize, color: iconColor),
              ],
            ],
          );

    final button = SizedBox(
      height: buttonHeight,
      child: isOutlined
          ? OutlinedButton(
              onPressed: isLoading ? null : onPressed,
              style: buttonStyle.copyWith(
                padding: WidgetStateProperty.all(buttonPadding),
              ),
              child: child,
            )
          : ElevatedButton(
              onPressed: isLoading ? null : onPressed,
              style: buttonStyle.copyWith(
                padding: WidgetStateProperty.all(buttonPadding),
              ),
              child: child,
            ),
    );

    return width != null ? SizedBox(width: width, child: button) : button;
  }

  _ButtonSize _getButtonSize(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return const _ButtonSize(
          height: 32,
          padding: EdgeInsets.symmetric(horizontal: 12),
          fontSize: 14,
        );
      case AppButtonSize.medium:
        return const _ButtonSize(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 16),
          fontSize: 16,
        );
      case AppButtonSize.large:
        return const _ButtonSize(
          height: 48,
          padding: EdgeInsets.symmetric(horizontal: 24),
          fontSize: 18,
        );
    }
  }
}

class _ButtonSize {
  final double height;
  final EdgeInsets padding;
  final double fontSize;

  const _ButtonSize({
    required this.height,
    required this.padding,
    required this.fontSize,
  });
}
