import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liftcore/src/core/constants/app_colors.dart';
import 'package:liftcore/src/shared/widgets/app_form_field.dart';

class AuthFormFieldData {
  const AuthFormFieldData({
    required this.label,
    required this.prefixIcon,
    this.controller,
    this.isPasswordType = false,
  });

  final String label;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final bool isPasswordType;
}

class AuthFormFieldItem extends StatelessWidget {
  const AuthFormFieldItem({
    super.key,
    required this.label,
    this.isPasswordType = false,
    this.controller,
    required this.prefixIcon,
  });

  final String label;
  final bool isPasswordType;
  final IconData prefixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return AppFormField(
      label: label,
      style: TextStyle(color: AppColors.white, fontSize: 16),
      labelStyle: TextStyle(color: Colors.white70, fontSize: 16),
      controller: controller,
      prefixIcon: Icon(
        prefixIcon,
        color: AppColors.white,
      ),
      suffixIcon: isPasswordType
          ? Icon(
              Iconsax.eye,
              color: Colors.white,
            )
          : null,
      contentPadding: EdgeInsets.only(bottom: 12),
      fillColor: Colors.transparent,
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFF565656), width: 0.5)),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFF565656), width: 0.5)),
    );
  }
}
