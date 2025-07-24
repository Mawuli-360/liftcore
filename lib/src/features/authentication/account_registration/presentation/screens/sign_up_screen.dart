import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liftcore/src/features/authentication/account_registration/presentation/widgets/auth_form_field_data.dart';
import 'package:liftcore/src/features/authentication/account_registration/presentation/widgets/auth_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthWidget(
      authTitle: 'Create your account',
      authBtnText: 'Create Account',
      authAltText: 'Or Create with',
      footerText: 'Log In',
      showCheckBox: true,
      checkBoxValue: false,
      formFields: [
        AuthFormFieldData(
          label: "Email",
          prefixIcon: Icons.mail_outline_rounded,
        ),
        AuthFormFieldData(
            label: "Password", prefixIcon: Iconsax.lock, isPasswordType: true),
        AuthFormFieldData(
            label: "Confirm Password",
            prefixIcon: Iconsax.lock,
            isPasswordType: true),
      ],
      checkBoxText: 'I agree to the Terms of Service',
      googleAccount: 'Create with Google',
      facebookAccount: 'Create with Facebook',
    );
  }
}
