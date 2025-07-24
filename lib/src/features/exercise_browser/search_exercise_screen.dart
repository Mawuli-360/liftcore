import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/core/constants/app_images.dart';
import 'package:liftcore/src/core/extensions/extensions.dart';
import 'package:liftcore/src/core/router/app_router.dart';
import 'package:liftcore/src/core/router/route_paths.dart';
import 'package:liftcore/src/shared/theme/app_spacing.dart';
import 'package:liftcore/src/shared/widgets/app_button.dart';
import 'package:liftcore/src/shared/widgets/app_form_field.dart';
import 'package:liftcore/src/shared/widgets/app_header.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';

class SearchExerciseScreen extends StatelessWidget {
  const SearchExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppHeader(
        title: "Search",
        isBackButton: false,
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppFormField(
              fillColor: Colors.transparent,
              hint: "Search something...",
              style: TextStyle(color: AppColors.white, fontSize: 16),
              prefixIcon: Icon(Iconsax.search_normal_14),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.borderColor,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.borderColor,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.borderColor,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(30),
              )),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                "Popular Workout",
                variant: AppTextVariant.headlineSmall,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(5, (index) {
                return ChoiceChip(label: Text("data"), selected: true);
              })),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                "Categories",
                variant: AppTextVariant.headlineSmall,
                fontWeight: FontWeight.w600,
              ),
              AppButton(
                text: "See More",
                backgroundColor: Colors.transparent,
                textColor: Colors.white70,
                onPressed: () => router.push(RoutePaths.exerciseCategoryScreen),
                icon: Icons.arrow_forward_ios,
                iconPosition: IconPosition.end,
                iconColor: AppColors.primaryColor,
                iconSize: 13,
              ),
            ],
          ),

          /// Categories item
          AppSpacing.gapH12,
          SizedBox(
            height: context.screenHeight * 0.18,
            child: ListView.separated(
                // Disable nested scrolling conflicts
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: context.screenHeight * 0.18,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: AppImages.backUp, fit: BoxFit.cover),
                        borderRadius: AppSpacing.roundedMd,
                        border: Border.all(
                            color: AppColors.borderColor, width: 0.5)),
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: const Alignment(-0.5, 1),
                      child: AppText(
                        "Muscle Gain",
                        variant: AppTextVariant.titleMedium,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemCount: 6),
          ),
        ],
      ),
    );
  }
}
