import 'package:flutter/material.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/core/extensions/extensions.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.image,
    required this.text,
    this.onTap,
  });

  final AssetImage image;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: ShapeDecoration(
          shape: StadiumBorder(),
          color: const Color(0xFF2C2C2C),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 8,
              children: [
                Image(
                  image: image,
                  height: context.screenHeight * 0.03,
                ),
                AppText(
                  text,
                  color: AppColors.white,
                  textAlign: TextAlign.center,
                  variant: AppTextVariant.bodyLarge,
                ),
              ],
            ),
            Icon(Icons.arrow_outward, color: AppColors.white)
          ],
        ),
      ),
    );
  }
}
