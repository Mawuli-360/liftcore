import 'package:flutter/material.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/core/extensions/extensions.dart';
import 'package:liftcore/src/shared/theme/app_spacing.dart';
import 'package:liftcore/src/shared/widgets/app_button.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';
import 'package:liftcore/src/shared/widgets/range_selector.dart';
import 'package:smooth_corner/smooth_corner.dart';

class CompleteRegistrationSteps extends StatefulWidget {
  const CompleteRegistrationSteps({super.key});

  @override
  State<CompleteRegistrationSteps> createState() =>
      _CompleteRegistrationStepsState();
}

class _CompleteRegistrationStepsState extends State<CompleteRegistrationSteps> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        itemBuilder: (context, index) {
          return SafeArea(
            child: SingleChildScrollView(
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    // Header section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          SizedBox(height: AppSpacing.giant),
                          AppText(
                            "How Old Are You?",
                            fontWeight: FontWeight.w600,
                            variant: AppTextVariant.headlineMedium,
                          ),
                          AppSpacing.gapH12,
                          AppText(
                            "Age in years. This will help us to personalize an exercise program plan that suits you.",
                            variant: AppTextVariant.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: AppSpacing.giant),
                          SizedBox(
                            height: context.height50,
                            child: ListWheelScrollView.useDelegate(
                              physics: FixedExtentScrollPhysics(),
                              itemExtent: 65,
                              perspective: 0.001,
                              squeeze: 1,
                              onSelectedItemChanged: (value) {
                                setState(() {
                                  selectedIndex = value;
                                });
                              },
                              childDelegate: ListWheelChildBuilderDelegate(
                                childCount: 70,
                                builder: (context, index) {
                                  final bool selectedItem =
                                      selectedIndex == index;
                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 400),
                                    width: context.width30,
                                    decoration: BoxDecoration(
                                        border: Border(
                                      top: BorderSide(
                                        color: selectedItem
                                            ? AppColors.primaryColor
                                            : Colors.transparent,
                                      ),
                                      bottom: BorderSide(
                                        color: selectedItem
                                            ? AppColors.primaryColor
                                            : Colors.transparent,
                                      ),
                                    )),
                                    child: Center(
                                      child: AppText(
                                        '${index + 17}',
                                        variant: selectedItem
                                            ? AppTextVariant.headlineLarge
                                            : AppTextVariant.headlineMedium,
                                        color: selectedItem
                                            ? AppColors.primaryColor
                                            : null,
                                        fontWeight: selectedIndex == index
                                            ? FontWeight.bold
                                            : FontWeight.w500,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 3,
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: AppSpacing.lg, left: 16, right: 16),
        child: AppButton(
          text: "Continue",
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

class WeightSelection extends StatelessWidget {
  const WeightSelection({
    super.key,
  });

  final double _weight = 70.0;
  // final double _height = 170.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom -
                kBottomNavigationBarHeight -
                32, // Account for bottom button
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                // Header section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      SizedBox(height: AppSpacing.giant),
                      AppText(
                        "What's Your Weight?",
                        fontWeight: FontWeight.w600,
                        variant: AppTextVariant.headlineMedium,
                      ),
                      AppSpacing.gapH12,
                      AppText(
                        "Weight in kg. Don't worry, you can always change it later.",
                        variant: AppTextVariant.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppSpacing.giant),
                      SizedBox(height: AppSpacing.md),
                    ],
                  ),
                ),

                // Unit selector (KG/LBS)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: List.generate(2, (index) {
                      final weights = ["KG", "LBS"];
                      return Expanded(
                        child: Container(
                          width: double.infinity,
                          height: AppSpacing.xxxl,
                          decoration: ShapeDecoration(
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color: index == 0
                                        ? Colors.transparent
                                        : const Color(0xFF656464),
                                    width: 0.5)),
                            color: index == 0
                                ? AppColors.primaryColor
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: AppText(
                              weights[index],
                              fontWeight: FontWeight.w600,
                              variant: AppTextVariant.bodyLarge,
                              color: index == 0 ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(height: AppSpacing.huge),

                // Range Selector - Give it a fixed height for scrolling
                SizedBox(
                  height: context.screenHeight * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: RangeSelector(
                      type: RangeType.weight,
                      initialValue: _weight,
                      minValue: 30.0,
                      maxValue: 150.0,
                      step: 1.0,
                      onValueChanged: (value) {
                        // setState(() {
                        //   _weight = value;
                        // });
                      },
                    ),
                  ),
                ),

                // Add some bottom spacing
                SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SetYourGoal extends StatelessWidget {
  const SetYourGoal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: AppSpacing.giant),
            AppText(
              "What's Your Goal?",
              fontWeight: FontWeight.w600,
              variant: AppTextVariant.headlineMedium,
            ),
            AppSpacing.gapH12,
            AppText(
              "You can choose more than one. Don't worry, you can\nalways change it later.",
              variant: AppTextVariant.titleMedium,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothContainer(
                    width: double.infinity,
                    padding: AppSpacing.a16,
                    borderRadius: AppSpacing.roundedSm,
                    side:
                        BorderSide(color: const Color(0xFF656464), width: 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText("Weight Loss",
                            variant: AppTextVariant.bodyLarge,
                            fontWeight: FontWeight.w600),
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        )
                      ],
                    ),
                  ),
                  SmoothContainer(
                    width: double.infinity,
                    padding: AppSpacing.a16,
                    color: AppColors.primaryColor,
                    borderRadius: AppSpacing.roundedSm,
                    side:
                        BorderSide(color: const Color(0xFF656464), width: 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          "Muscle Gain",
                          variant: AppTextVariant.bodyLarge,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        Checkbox(
                          value: true,
                          fillColor: WidgetStatePropertyAll(Colors.black),
                          checkColor: AppColors.primaryColor,
                          onChanged: (value) {},
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        )
                      ],
                    ),
                  ),
                  SmoothContainer(
                    width: double.infinity,
                    padding: AppSpacing.a16,
                    borderRadius: AppSpacing.roundedSm,
                    side:
                        BorderSide(color: const Color(0xFF656464), width: 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText("Flexibility & Mobility",
                            variant: AppTextVariant.bodyLarge,
                            fontWeight: FontWeight.w600),
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        )
                      ],
                    ),
                  ),
                  SmoothContainer(
                    width: double.infinity,
                    padding: AppSpacing.a16,
                    borderRadius: AppSpacing.roundedSm,
                    side:
                        BorderSide(color: const Color(0xFF656464), width: 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText("Fit Body",
                            variant: AppTextVariant.bodyLarge,
                            fontWeight: FontWeight.w600),
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.huge),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ActivityLevel extends StatelessWidget {
  const ActivityLevel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: AppSpacing.giant),
            AppText(
              "Physical Activity Level?",
              fontWeight: FontWeight.w600,
              variant: AppTextVariant.headlineMedium,
            ),
            AppSpacing.gapH12,
            AppText(
              "Choose your regular activity level. This will help us to\n personalize plans for you",
              variant: AppTextVariant.titleMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSpacing.giant),
            SizedBox(height: AppSpacing.giant),
            Expanded(
                child: Column(
              spacing: 16,
              children: [
                SmoothContainer(
                  width: double.infinity,
                  padding: AppSpacing.a16,
                  borderRadius: AppSpacing.roundedSm,
                  side: BorderSide(color: const Color(0xFF656464), width: 0.5),
                  child: Center(
                    child: AppText("Beginner",
                        variant: AppTextVariant.bodyLarge,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SmoothContainer(
                  width: double.infinity,
                  padding: AppSpacing.a16,
                  borderRadius: AppSpacing.roundedSm,
                  color: AppColors.primaryColor,
                  side: BorderSide(color: const Color(0xFF656464), width: 0.5),
                  child: Center(
                    child: AppText("Intermediate",
                        variant: AppTextVariant.bodyLarge,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SmoothContainer(
                  width: double.infinity,
                  padding: AppSpacing.a16,
                  borderRadius: AppSpacing.roundedSm,
                  side: BorderSide(color: const Color(0xFF656464), width: 0.5),
                  child: Center(
                    child: AppText("Advanced",
                        variant: AppTextVariant.bodyLarge,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class GenderSelection extends StatelessWidget {
  const GenderSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: AppSpacing.giant),
          AppText(
            "Tell Us About Yourself",
            fontWeight: FontWeight.w600,
            variant: AppTextVariant.headlineMedium,
          ),
          AppSpacing.gapH12,
          AppText(
            "To give you a better experience and results we need\nto know your gender.",
            variant: AppTextVariant.bodyLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSpacing.giant),
          Container(
            height: context.screenHeight * 0.18,
            width: context.screenHeight * 0.18,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: AppColors.primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.male, color: Colors.black, size: 85),
                AppText(
                  "Male",
                  variant: AppTextVariant.headlineSmall,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          AppSpacing.gapH12,
          Container(
            height: context.screenHeight * 0.18,
            width: context.screenHeight * 0.18,
            decoration: ShapeDecoration(
              shape: CircleBorder(
                  side: BorderSide(color: const Color(0xFF656464), width: 0.5)),
              color: Colors.black,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.female,
                  color: Colors.white,
                  size: 85,
                ),
                AppText(
                  "Female",
                  variant: AppTextVariant.headlineSmall,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
