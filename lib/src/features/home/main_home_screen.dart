import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/core/extensions/extensions.dart';
import 'package:smooth_corner/smooth_corner.dart';

class MainHomeScreen extends ConsumerWidget {
  const MainHomeScreen({super.key, this.navigationShell});
  final StatefulNavigationShell? navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          Positioned.fill(child: navigationShell!),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _HomeNavBar(
                navigationShell: navigationShell,
              )),
        ],
      ),
    );
  }
}

class _HomeNavBar extends ConsumerWidget {
  _HomeNavBar({required this.navigationShell});

  final StatefulNavigationShell? navigationShell;

  final List<IconData> navIcons = [
    Iconsax.home,
    Iconsax.search_normal_14,
    Iconsax.graph,
    Iconsax.user
  ];

  void _goBranch(int index) {
    navigationShell!.goBranch(
      index,
      initialLocation: index == navigationShell!.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SmoothContainer(
      height: context.screenHeight * 0.1,
      color: AppColors.secondaryColor,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      child: Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(navIcons.length, (index) {
            return GestureDetector(
              onTap: () {
                _goBranch(index);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 6),
                decoration: ShapeDecoration(
                    color: navigationShell!.currentIndex == index
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    shape: StadiumBorder()),
                child: Icon(
                  navIcons[index],
                  size: 25,
                  color: navigationShell!.currentIndex == index
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
