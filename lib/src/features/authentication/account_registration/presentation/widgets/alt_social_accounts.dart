import 'package:flutter/material.dart';
import 'package:liftcore/src/core/constants/app_images.dart';
import 'package:liftcore/src/features/authentication/account_registration/presentation/widgets/social_button.dart';

class AltSocialAccounts extends StatelessWidget {
  const AltSocialAccounts({
    super.key,
    required this.googleAccount,
    required this.facebookAccount,
  });

  final String googleAccount;
  final String facebookAccount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        SocialButton(
          image: AppImages.google,
          text: googleAccount,
        ),
        SocialButton(
          image: AppImages.facebook,
          text: facebookAccount,
        )
      ],
    );
  }
}
