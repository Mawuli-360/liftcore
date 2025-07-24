import 'package:flutter/material.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/features/authentication/account_registration/presentation/widgets/alt_social_accounts.dart';
import 'package:liftcore/src/features/authentication/account_registration/presentation/widgets/auth_form_field_card.dart';
import 'package:liftcore/src/features/authentication/account_registration/presentation/widgets/auth_form_field_data.dart';
import 'package:liftcore/src/shared/theme/app_spacing.dart';
import 'package:liftcore/src/shared/widgets/app_button.dart';
import 'package:liftcore/src/shared/widgets/app_rich_text.dart';
import 'package:liftcore/src/shared/widgets/app_text.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    super.key,
    required this.authTitle,
    required this.authBtnText,
    required this.authAltText,
    required this.footerText,
    required this.formFields,
    this.showCheckBox = false,
    required this.checkBoxText,
    this.checkBoxValue = false,
    this.onCheckBoxValueChange,
    this.showForgotPassword = false,
    this.forgotPasswordText = "Forgotten Password?",
    this.onForgotPasswordTap,
    required this.googleAccount,
    required this.facebookAccount,
  });

  final String authTitle;
  final String authBtnText;
  final String authAltText;
  final String footerText;
  final List<AuthFormFieldData> formFields;
  final bool showCheckBox;
  final String checkBoxText;
  final bool checkBoxValue;
  final ValueChanged<bool?>? onCheckBoxValueChange;
  final bool showForgotPassword;
  final String forgotPasswordText;
  final VoidCallback? onForgotPasswordTap;
  final String googleAccount;
  final String facebookAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppText(
                  "LOGO HERE",
                  variant: AppTextVariant.headlineLarge,
                  textAlign: TextAlign.center,
                  color: AppColors.white,
                ),
                AppSpacing.gapH24,
                _buildAuthTitle(),
                AppSpacing.gapH24,
                AuthFormFieldCard(
                  formFields: formFields,
                  checkBoxText: checkBoxText,
                  showCheckBox: showCheckBox,
                  checkBoxValue: checkBoxValue,
                  showForgotPassword: showForgotPassword,
                  onCheckBoxValueChange: onCheckBoxValueChange,
                  onForgotPasswordTap: onForgotPasswordTap,
                  forgotPasswordText: forgotPasswordText,
                ),
                AppSpacing.gapH12,
                _buildAuthButton(),
                AppSpacing.gapH24,
                _buildAuthAltText(),
                AppSpacing.gapH24,
                AltSocialAccounts(
                  googleAccount: googleAccount,
                  facebookAccount: facebookAccount,
                ),
                AppSpacing.gapH24,
                _buildAuthFooter(),
                // AppSpacing.gapH24,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAuthFooter() {
    return AppRichText(
      textAlign: TextAlign.center,
      textSpans: [
        AppTextSpan(
          text: "Don't have an account? ",
          color: Colors.white,
          fontSize: 16,
        ),
        AppTextSpan(
          text: footerText,
          color: AppColors.primaryColor,
          fontSize: 16,
        ),
      ],
    );
  }

  Widget _buildAuthButton() {
    return AppButton(
        text: authBtnText,
        textColor: Colors.black,
        size: AppButtonSize.large,
        backgroundColor: AppColors.primaryColor,
        borderStyle: AppButtonBorderStyle.stadium,
        onPressed: () {});
  }

  Widget _buildAuthAltText() {
    return AppText(
      authAltText,
      color: AppColors.white,
      textAlign: TextAlign.center,
      variant: AppTextVariant.bodyLarge,
    );
  }

  Widget _buildAuthTitle() {
    return AppText(
      authTitle,
      variant: AppTextVariant.headlineMedium,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
    );
  }
}
