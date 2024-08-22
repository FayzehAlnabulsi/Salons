import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'AppColor.dart';
import 'AppMessage.dart';
import 'AppSize.dart';

class AppAsyncTextFields extends StatelessWidget {
  final Future<bool> Function(String?) validator;
  final TextEditingController controller;
  final String hintText;
  final String invalidMessage;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final Color? fillColor;
  final Color? labelColor;
  final Color? textColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final TextAlign? textAlignment;
  final Function(String)? onSubmit;
  final String? helperText;
  final TextDirection? textDirection;
  final double? radius;
  final Color? borderColor;
  final Color? focusedColor;
  final Color? hintColor;
  final double? labelSize;
  final double? borderThickness;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final String? labelText;
  final double? textSize;
  final bool? enabled;
  const AppAsyncTextFields(
      {Key? key,
      required this.validator,
      required this.controller,
      required this.hintText,
      required this.invalidMessage,
      this.inputFormatters,
      this.keyboardType,
      this.labelSize,
      this.onTap,
      this.borderColor,
      this.borderThickness,
      this.fillColor,
      this.focusedColor,
      this.helperText,
      this.hintColor,
      this.labelColor,
      this.onChanged,
      this.onSubmit,
      this.prefixIcon,
      this.radius,
      this.suffixIcon,
      this.textAlignment,
      this.textColor,
      this.textDirection,
      this.contentPadding,
      this.focusNode,
      this.labelText,
      this.textSize,
      this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AsyncTextFormField(
      validator: validator,
      controller: controller,
      hintText: hintText,
      valueIsEmptyMessage: AppMessage.mandatoryTx,
      valueIsInvalidMessage: invalidMessage,
      isValidatingMessage: AppMessage.validatingUrl,
      validationDebounce: const Duration(milliseconds: 200),
      fillColor: fillColor,
      textDirection: textDirection,
      borderColor: borderColor,
      labelColor: labelColor,
      onTap: onTap,
      borderThickness: borderThickness,
      contentPadding: contentPadding,
      focusedColor: focusedColor,
      focusNode: focusNode,
      hintColor: hintColor,
      helperText: helperText,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      labelSize: labelSize,
      labelText: labelText,
      onChanged: onChanged,
      onSubmit: onSubmit,
      prefixIcon: prefixIcon,
      radius: radius,
      suffixIcon: suffixIcon,
      textAlignment: textAlignment,
      textColor: textColor,
      textSize: textSize,
      enabled: enabled,
    );
  }
}

class AsyncTextFormField extends StatefulWidget {
  final Future<bool> Function(String) validator;
  final Duration validationDebounce;
  final TextEditingController controller;
  final String hintText;
  final String isValidatingMessage;
  final String valueIsEmptyMessage;
  final String valueIsInvalidMessage;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final Color? fillColor;
  final Color? labelColor;
  final Color? textColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final TextAlign? textAlignment;
  final Function(String)? onSubmit;
  final String? helperText;
  final TextDirection? textDirection;
  final double? radius;
  final Color? borderColor;
  final Color? focusedColor;
  final Color? hintColor;
  final double? labelSize;
  final double? borderThickness;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final String? labelText;
  final double? textSize;
  final bool? enabled;
  const AsyncTextFormField(
      {Key? key,
      required this.validator,
      required this.validationDebounce,
      required this.controller,
      required this.isValidatingMessage,
      required this.valueIsEmptyMessage,
      required this.valueIsInvalidMessage,
      required this.hintText,
      this.inputFormatters,
      this.keyboardType,
      this.labelSize,
      this.onTap,
      this.borderColor,
      this.borderThickness,
      this.fillColor,
      this.focusedColor,
      this.helperText,
      this.hintColor,
      this.labelColor,
      this.onChanged,
      this.onSubmit,
      this.prefixIcon,
      this.radius,
      this.suffixIcon,
      this.textAlignment,
      this.textColor,
      this.textDirection,
      this.contentPadding,
      this.focusNode,
      this.labelText,
      this.textSize,
      this.enabled})
      : super(key: key);

  @override
  _AsyncTextFormFieldState createState() => _AsyncTextFormFieldState();
}

class _AsyncTextFormFieldState extends State<AsyncTextFormField> {
  Timer? _debounce;
  var isValidating = false;
  var isValid = false;
  var isDirty = false;
  var isWaiting = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (isValidating) {
          return null;
        }
        if (value?.isEmpty ?? false) {
          return widget.valueIsEmptyMessage;
        }
        if (!isWaiting && !isValid) {
          return widget.valueIsInvalidMessage;
        }
        return null;
      },
      onChanged: (text) async {
        isDirty = true;
        if (text.isEmpty) {
          setState(() {
            isValid = false;
          });
          cancelTimer();
          return;
        }
        isWaiting = true;
        cancelTimer();
        _debounce = Timer(widget.validationDebounce, () async {
          isWaiting = false;
          isValid = await validate(text);
          print(isValid);
          setState(() {});
          isValidating = false;
        });
      },
      textAlign: widget.textAlignment ?? TextAlign.start,
      controller: widget.controller,
      maxLines: 1,
      onTap: widget.onTap,
      autocorrect: false,
      enableSuggestions: false,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      cursorRadius: Radius.circular(20.r),
      cursorColor: AppColor.subColor,
      onFieldSubmitted: widget.onSubmit,
      textDirection: widget.textDirection,
      focusNode: widget.focusNode,
      enabled: widget.enabled ?? false,
      style: TextStyle(
        color: widget.textColor ?? AppColor.textColor,
        fontSize: widget.labelSize ?? AppSize.textFieldsFontSize,
      ),
      decoration: InputDecoration(
          helperText: widget.helperText,
          filled: true,
          errorStyle: TextStyle(
              color: AppColor.errorColor,
              fontSize: AppSize.errorSize,
              fontFamily: GoogleFonts.tajawal().fontFamily),
          hintStyle: TextStyle(
            color: widget.hintColor ?? AppColor.textColor.withOpacity(0.60),
            fontSize: AppSize.textFieldsHintSize,
          ),
          fillColor: widget.fillColor ?? AppColor.grey.withOpacity(0.6),
          labelStyle: TextStyle(
              color: widget.labelColor ?? AppColor.textColor,
              fontSize: widget.textSize ?? AppSize.textFieldsHintSize),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                widget.radius ?? AppSize.fieldsBorderRadius),
            borderSide: BorderSide(
                color: widget.borderColor ?? AppColor.grey.withOpacity(0.6),
                width: widget.borderThickness ?? 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                widget.radius ?? AppSize.fieldsBorderRadius),
            borderSide: BorderSide(
                color: widget.borderColor ?? AppColor.grey.withOpacity(0.6),
                width: widget.borderThickness ?? 0.7),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                widget.radius ?? AppSize.fieldsBorderRadius),
            borderSide: BorderSide(
                color: widget.borderColor ?? AppColor.grey.withOpacity(0.6),
                width: widget.borderThickness ?? 0.7),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  widget.radius ?? AppSize.fieldsBorderRadius),
              borderSide: BorderSide(
                  color: widget.focusedColor ??
                      AppColor.mainColor.withOpacity(0.3),
                  width: widget.borderThickness ?? 0.7)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  widget.radius ?? AppSize.fieldsBorderRadius),
              borderSide: BorderSide(color: AppColor.errorColor, width: 0.7)),
          hintText: widget.hintText,
          labelText: widget.labelText,
          contentPadding:
              widget.contentPadding ?? EdgeInsets.all(AppSize.contentPadding),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    cancelTimer();
    super.dispose();
  }

  void cancelTimer() {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
  }

  Future<bool> validate(String text) async {
    setState(() {
      isValidating = true;
    });
    final isValid = await widget.validator(text);
    isValidating = false;
    return isValid;
  }
}
