import 'package:flutter/material.dart';
import 'package:liftcore/src/core/router/app_router.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double elevation;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final bool isBackButton;

  const AppHeader({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.centerTitle = true,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation = 0,
    this.flexibleSpace,
    this.bottom,
    this.toolbarHeight,
    this.isBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppText(
        title,
        variant: isBackButton
            ? AppTextVariant.titleLarge
            : AppTextVariant.headlineMedium,
        fontWeight: isBackButton ? FontWeight.w600 : FontWeight.bold,
        color: Colors.white,
      ),
      leading: isBackButton
          ? Padding(
              padding: const EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () => router.pop(),
                child: CircleAvatar(
                  backgroundColor: const Color(0xFF131313),
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : null,
      actions: actions,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? Colors.black,
      elevation: elevation,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      toolbarHeight: toolbarHeight,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        (toolbarHeight ?? kToolbarHeight) + (bottom?.preferredSize.height ?? 0),
      );
}
