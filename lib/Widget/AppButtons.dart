import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'AppColor.dart';
import 'AppSize.dart';
import 'AppText.dart';

class AppButtons extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? textStyleColor;
  final FontWeight? textStyleWeight;
  final TextOverflow? overflow;
  final double? elevation;
  final double? width;
  final double? height;
  final Widget? icon;
  final double? textSize;
  final double? radius;
  final BorderSide? side;
  final Widget? label;
  final AlignmentGeometry? alignment;
  final FontWeight? fontWeight;
  const AppButtons(
      {Key? key,
        required this.onPressed,
        required this.text,
        this.backgroundColor,
        this.overflow,
        this.textStyleColor,
        this.textStyleWeight,
        this.width,
        this.elevation,
        this.height,
        this.icon,
        this.textSize,
        this.radius,
        this.alignment,
        this.side,
        this.fontWeight,
        this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 45.h,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          alignment: alignment,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  radius ?? AppSize.textFieldsBorderRadius),
              side: side ?? BorderSide.none),
          backgroundColor: backgroundColor ?? AppColor.textColor,
          elevation: elevation ?? 1.0,
          textStyle: TextStyle(
              fontFamily: GoogleFonts.tajawal().fontFamily,
              color: textStyleColor ?? AppColor.white,
              fontSize: AppSize.buttonsFontSize,
              fontStyle: FontStyle.normal,
              fontWeight: fontWeight),
        ),
        onPressed: onPressed,
        icon: icon?? const SizedBox(),
        label: label ??
            AppText(
                fontSize: textSize ?? AppSize.buttonsFontSize,
                text: text,
                color: textStyleColor ?? AppColor.white,
                fontWeight: fontWeight,
                fontFamily: GoogleFonts.tajawal().fontFamily),
      ),
    );
  }
}