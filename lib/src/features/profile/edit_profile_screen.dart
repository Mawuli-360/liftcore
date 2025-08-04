import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/core/constants/app_images.dart';
import 'package:liftcore/src/shared/theme/app_spacing.dart';
import 'package:liftcore/src/shared/widgets/app_button.dart';
import 'package:liftcore/src/shared/widgets/app_header.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';
import 'package:smooth_corner/smooth_corner.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppHeader(title: "Edit Your Profile"),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: AppSpacing.sm),
            child: Column(
              children: [
                AppSpacing.gapH24,
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AppImages.avatar,
                    ),
                    Positioned(
                      left: 42,
                      bottom: 5,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.black.withAlpha(155),
                        child: Icon(
                          Iconsax.camera,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                AppSpacing.gapH12,
                SmoothContainer(
                  padding: EdgeInsets.symmetric(
                      vertical: AppSpacing.xs, horizontal: AppSpacing.md),
                  margin: AppSpacing.a12,
                  borderRadius: AppSpacing.roundedMd,
                  side: BorderSide(color: AppColors.borderColor, width: 0.5),
                  child: Column(
                    children: [
                      _InfoHorizontalTile(
                        isFirstTile: true,
                      ),
                      _InfoVerticalTile(),
                      _InfoVerticalTile(),
                      _InfoHorizontalTile(),
                      _InfoHorizontalTile(),
                      _InfoHorizontalTile(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: AppSpacing.lg, left: 16, right: 16),
        child: AppButton(
          text: "Update Profile",
          textColor: Colors.black,
          size: AppButtonSize.large,
          backgroundColor: AppColors.primaryColor,
          borderStyle: AppButtonBorderStyle.stadium,
          onPressed: () {},
        ),
      ),
    );
  }
}

class _InfoVerticalTile extends StatelessWidget {
  const _InfoVerticalTile();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: AppColors.borderColor,
            thickness: 0.5,
          ),
          AppSpacing.gapH12,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                "First Name",
                variant: AppTextVariant.bodyLarge,
              ),
              AppText(
                "Alex",
                fontWeight: FontWeight.w600,
                variant: AppTextVariant.titleLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoHorizontalTile extends StatelessWidget {
  const _InfoHorizontalTile({this.isFirstTile = false});

  final bool isFirstTile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isFirstTile)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
            child: Divider(
              color: AppColors.borderColor,
              thickness: 0.5,
            ),
          ),
        AppSpacing.gapH12,
        Row(
          children: [
            Expanded(child: _InfoTile()),
            SizedBox(
              height: 30,
              child: VerticalDivider(
                color: AppColors.borderColor,
                thickness: 1,
              ),
            ),
            Expanded(
              child: _InfoTile(),
            ),
          ],
        ),
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "First Name",
            variant: AppTextVariant.bodyLarge,
          ),
          AppText(
            "Alex",
            fontWeight: FontWeight.w600,
            variant: AppTextVariant.titleLarge,
          ),
        ],
      ),
    );
  }
}
