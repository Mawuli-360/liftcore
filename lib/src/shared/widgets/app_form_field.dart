import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum AppFormFieldType {
  text,
  email,
  password,
  phone,
  number,
  multiline,
}

class AppFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final TextEditingController? controller;
  final AppFormFieldType type;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final double? cursorHeight;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final Color? fillColor;
  final Color? focusColor;
  final Color? errorColor;
  final Color? cursorColor;
  final BorderRadius? borderRadius;
  final double? borderWidth;
  final bool showCursor;
  final bool autocorrect;
  final bool enableSuggestions;
  final TextCapitalization textCapitalization;
  final FocusNode? focusNode;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;

  const AppFormField(
      {super.key,
      this.label,
      this.hint,
      this.initialValue,
      this.controller,
      this.type = AppFormFieldType.text,
      this.readOnly = false,
      this.enabled = true,
      this.autofocus = false,
      this.maxLines = 1,
      this.minLines,
      this.maxLength,
      this.textInputAction,
      this.inputFormatters,
      this.onChanged,
      this.onSubmitted,
      this.validator,
      this.prefix,
      this.suffix,
      this.prefixIcon,
      this.suffixIcon,
      this.contentPadding,
      this.style,
      this.labelStyle,
      this.hintStyle,
      this.errorStyle,
      this.fillColor,
      this.focusColor,
      this.errorColor,
      this.borderRadius,
      this.borderWidth,
      this.showCursor = true,
      this.autocorrect = true,
      this.enableSuggestions = true,
      this.textCapitalization = TextCapitalization.none,
      this.focusNode,
      this.border,
      this.errorBorder,
      this.focusedBorder,
      this.focusedErrorBorder,
      this.disabledBorder,
      this.enabledBorder,
      this.cursorColor,
      this.cursorHeight});

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  late bool _obscureText;
  late TextInputType _keyboardType;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.type == AppFormFieldType.password;
    _keyboardType = _getKeyboardType();
  }

  TextInputType _getKeyboardType() {
    switch (widget.type) {
      case AppFormFieldType.email:
        return TextInputType.emailAddress;
      case AppFormFieldType.password:
        return TextInputType.visiblePassword;
      case AppFormFieldType.phone:
        return TextInputType.phone;
      case AppFormFieldType.number:
        return TextInputType.number;
      case AppFormFieldType.multiline:
        return TextInputType.multiline;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      keyboardType: _keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      cursorColor: widget.cursorColor ?? Colors.white,
      cursorHeight: widget.cursorHeight ?? 16,
      style: widget.style ?? theme.textTheme.bodyLarge,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        labelStyle: widget.labelStyle,
        hintStyle: widget.hintStyle,
        errorStyle: widget.errorStyle,
        prefix: widget.prefix,
        suffix: widget.suffix,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.type == AppFormFieldType.password
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: theme.hintColor,
                ),
                onPressed: () => setState(() => _obscureText = !_obscureText),
              )
            : widget.suffixIcon,
        filled: true,
        fillColor: widget.fillColor ?? theme.inputDecorationTheme.fillColor,
        focusColor: widget.focusColor ?? colorScheme.primary,
        enabledBorder: widget.enabledBorder,
        border: widget.border,
        focusedBorder: widget.focusedBorder,
        errorBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
          borderSide: BorderSide(
            color: widget.errorColor ?? colorScheme.error,
            width: widget.borderWidth ?? 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
          borderSide: BorderSide(
            color: widget.errorColor ?? colorScheme.error,
            width: widget.borderWidth ?? 2.0,
          ),
        ),
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      obscureText: _obscureText,
      maxLines: widget.type == AppFormFieldType.multiline ? widget.maxLines : 1,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      showCursor: widget.showCursor,
      autocorrect: widget.autocorrect,
      enableSuggestions: widget.enableSuggestions,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      validator: widget.validator,
      focusNode: widget.focusNode,
    );
  }
}
