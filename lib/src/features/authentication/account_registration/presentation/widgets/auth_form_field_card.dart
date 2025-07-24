import 'package:flutter/material.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/features/authentication/account_registration/presentation/widgets/auth_form_field_data.dart';
import 'package:liftcore/src/shared/theme/app_spacing.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';
import 'package:smooth_corner/smooth_corner.dart';

class AuthFormFieldCard extends StatelessWidget {
  const AuthFormFieldCard({
    super.key,
    required this.formFields,
    required this.showCheckBox,
    required this.checkBoxText,
    required this.checkBoxValue,
    required this.onCheckBoxValueChange,
    required this.showForgotPassword,
    required this.forgotPasswordText,
    required this.onForgotPasswordTap,
  });

  final List<AuthFormFieldData> formFields;
  final bool showCheckBox;
  final String checkBoxText;
  final bool checkBoxValue;
  final ValueChanged<bool?>? onCheckBoxValueChange;
  final bool showForgotPassword;
  final String forgotPasswordText;
  final VoidCallback? onForgotPasswordTap;

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      padding: AppSpacing.a16,
      side: BorderSide(color: const Color(0xFF565656)),
      borderRadius: AppSpacing.roundedSm,
      child: Column(
        children: [
          ...formFields.asMap().entries.map((entry) {
            final index = entry.key;
            final fieldData = entry.value;

            return Column(
              children: [
                if (index > 0) AppSpacing.gapH16,
                AuthFormFieldItem(
                  label: fieldData.label,
                  prefixIcon: fieldData.prefixIcon,
                  controller: fieldData.controller,
                  isPasswordType: fieldData.isPasswordType,
                ),
              ],
            );
          }),
          if (showCheckBox || showForgotPassword) ...[
            AppSpacing.gapH16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (showCheckBox)
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: onCheckBoxValueChange,
                        fillColor: WidgetStatePropertyAll(AppColors.white),
                        checkColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                          color: Colors.white,
                          width: 2,
                        )),
                      ),
                      AppText(
                        checkBoxText,
                        variant: AppTextVariant.bodyLarge,
                      ),
                    ],
                  )
                else
                  const SizedBox.shrink(),
                if (showForgotPassword)
                  GestureDetector(
                    onTap: onForgotPasswordTap,
                    child: AppText(
                      forgotPasswordText,
                      color: AppColors.primaryColor,
                      variant: AppTextVariant.bodyLarge,
                    ),
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
