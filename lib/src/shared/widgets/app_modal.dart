import 'package:flutter/material.dart';

class AppModal extends StatelessWidget {
  final String title;
  final Widget content;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool isLoading;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final bool isOverlay;

  const AppModal({
    super.key,
    required this.title,
    required this.content,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.isLoading = false,
    this.backgroundColor,
    this.width,
    this.height,
    this.isOverlay = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    final modalContent = Container(
      width: width ?? size.width,
      constraints: BoxConstraints(
        maxWidth: isOverlay ? double.infinity : 600,
        maxHeight: height ?? size.height,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.dialogBackgroundColor,
        borderRadius: isOverlay
            ? const BorderRadius.vertical(top: Radius.circular(16))
            : BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                    onCancel?.call();
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // Content
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: content,
              ),
            ),
          ),

          // Actions
          if (confirmText != null || cancelText != null)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: theme.dividerColor,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (cancelText != null)
                    TextButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              Navigator.of(context).pop();
                              onCancel?.call();
                            },
                      child: Text(cancelText!),
                    ),
                  const SizedBox(width: 8),
                  if (confirmText != null)
                    FilledButton(
                      onPressed: isLoading ? null : onConfirm,
                      child: isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : Text(confirmText!),
                    ),
                ],
              ),
            ),
        ],
      ),
    );

    if (isOverlay) {
      return Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Semi-transparent background
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  if (!isLoading) {
                    Navigator.of(context).pop();
                    onCancel?.call();
                  }
                },
                child: Container(
                  color: Colors.black54,
                ),
              ),
            ),
            // Modal content at the top
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: modalContent,
            ),
          ],
        ),
      );
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      child: modalContent,
    );
  }

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required Widget content,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool isLoading = false,
    Color? backgroundColor,
    double? width,
    double? height,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: !isLoading,
      builder: (context) => AppModal(
        title: title,
        content: content,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        isLoading: isLoading,
        backgroundColor: backgroundColor,
        width: width,
        height: height,
      ),
    );
  }

  static Future<T?> showOverlay<T>(
    BuildContext context, {
    required String title,
    required Widget content,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool isLoading = false,
    Color? backgroundColor,
    double? width,
    double? height,
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: !isLoading,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          )),
          child: AppModal(
            title: title,
            content: content,
            confirmText: confirmText,
            cancelText: cancelText,
            onConfirm: onConfirm,
            onCancel: onCancel,
            isLoading: isLoading,
            backgroundColor: backgroundColor,
            width: width,
            height: height,
            isOverlay: true,
          ),
        );
      },
    );
  }
}
