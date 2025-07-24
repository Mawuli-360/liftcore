import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liftcore/src/features/authentication/account_registration/presentation/widgets/auth_form_field_data.dart';
import 'package:liftcore/src/features/authentication/account_registration/presentation/widgets/auth_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthWidget(
      authTitle: 'Log in your account',
      authBtnText: 'Log in',
      authAltText: 'Or Log in with',
      footerText: 'Create Account',
      showCheckBox: true,
      checkBoxValue: false,
      formFields: [
        AuthFormFieldData(
          label: "Email",
          prefixIcon: Icons.mail_outline_rounded,
        ),
        AuthFormFieldData(
            label: "Password", prefixIcon: Iconsax.lock, isPasswordType: true),
      ],
      checkBoxText: 'Remember Me',
      showForgotPassword: true,
      googleAccount: 'Log in with Google',
      facebookAccount: 'Log in with Facebook',
    );
  }
}
