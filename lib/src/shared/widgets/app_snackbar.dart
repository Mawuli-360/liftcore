import 'package:flutter/material.dart';

enum AppSnackBarType { success, error, warning, info }

class AppSnackBar extends SnackBar {
  AppSnackBar({
    super.key,
    required String message,
    AppSnackBarType type = AppSnackBarType.info,
    Duration? duration,
    super.action,
    bool super.showCloseIcon = true,
  }) : super(
          content: _SnackBarContent(
            message: message,
            type: type,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.zero,
          duration: duration ?? const Duration(seconds: 4),
          closeIconColor: _getIconColor(type),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
        );

  static Color _getIconColor(AppSnackBarType type) {
    switch (type) {
      case AppSnackBarType.success:
        return Colors.green;
      case AppSnackBarType.error:
        return Colors.red;
      case AppSnackBarType.warning:
        return Colors.orange;
      case AppSnackBarType.info:
        return Colors.blue;
    }
  }

  static void show(
    BuildContext context, {
    required String message,
    AppSnackBarType type = AppSnackBarType.info,
    Duration? duration,
    SnackBarAction? action,
    bool showCloseIcon = true,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBar(
        message: message,
        type: type,
        duration: duration,
        action: action,
        showCloseIcon: showCloseIcon,
      ),
    );
  }

  static void success(
    BuildContext context, {
    required String message,
    Duration? duration,
    SnackBarAction? action,
    bool showCloseIcon = true,
  }) {
    show(
      context,
      message: message,
      type: AppSnackBarType.success,
      duration: duration,
      action: action,
      showCloseIcon: showCloseIcon,
    );
  }

  static void error(
    BuildContext context, {
    required String message,
    Duration? duration,
    SnackBarAction? action,
    bool showCloseIcon = true,
  }) {
    show(
      context,
      message: message,
      type: AppSnackBarType.error,
      duration: duration,
      action: action,
      showCloseIcon: showCloseIcon,
    );
  }

  static void warning(
    BuildContext context, {
    required String message,
    Duration? duration,
    SnackBarAction? action,
    bool showCloseIcon = true,
  }) {
    show(
      context,
      message: message,
      type: AppSnackBarType.warning,
      duration: duration,
      action: action,
      showCloseIcon: showCloseIcon,
    );
  }

  static void info(
    BuildContext context, {
    required String message,
    Duration? duration,
    SnackBarAction? action,
    bool showCloseIcon = true,
  }) {
    show(
      context,
      message: message,
      type: AppSnackBarType.info,
      duration: duration,
      action: action,
      showCloseIcon: showCloseIcon,
    );
  }
}

class _SnackBarContent extends StatelessWidget {
  final String message;
  final AppSnackBarType type;

  const _SnackBarContent({
    required this.message,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: _getBackgroundColor(type),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: _getBorderColor(type),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            _getIcon(type),
            color: _getIconColor(type),
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: _getTextColor(type),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getBackgroundColor(AppSnackBarType type) {
    switch (type) {
      case AppSnackBarType.success:
        return Colors.green.withValues(alpha: 0.1);
      case AppSnackBarType.error:
        return Colors.red.withValues(alpha: 0.1);
      case AppSnackBarType.warning:
        return Colors.orange.withValues(alpha: 0.1);
      case AppSnackBarType.info:
        return Colors.blue.withValues(alpha: 0.1);
    }
  }

  Color _getBorderColor(AppSnackBarType type) {
    switch (type) {
      case AppSnackBarType.success:
        return Colors.green.withValues(alpha: 0.2);
      case AppSnackBarType.error:
        return Colors.red.withValues(alpha: 0.2);
      case AppSnackBarType.warning:
        return Colors.orange.withValues(alpha: 0.2);
      case AppSnackBarType.info:
        return Colors.blue.withValues(alpha: 0.2);
    }
  }

  Color _getTextColor(AppSnackBarType type) {
    switch (type) {
      case AppSnackBarType.success:
        return Colors.green;
      case AppSnackBarType.error:
        return Colors.red;
      case AppSnackBarType.warning:
        return Colors.orange;
      case AppSnackBarType.info:
        return Colors.blue;
    }
  }

  Color _getIconColor(AppSnackBarType type) {
    switch (type) {
      case AppSnackBarType.success:
        return Colors.green;
      case AppSnackBarType.error:
        return Colors.red;
      case AppSnackBarType.warning:
        return Colors.orange;
      case AppSnackBarType.info:
        return Colors.blue;
    }
  }

  IconData _getIcon(AppSnackBarType type) {
    switch (type) {
      case AppSnackBarType.success:
        return Icons.check_circle_outline;
      case AppSnackBarType.error:
        return Icons.error_outline;
      case AppSnackBarType.warning:
        return Icons.warning_amber_outlined;
      case AppSnackBarType.info:
        return Icons.info_outline;
    }
  }
}
