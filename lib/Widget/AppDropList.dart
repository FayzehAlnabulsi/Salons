import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AppColor.dart';
import 'AppIcons.dart';
import 'AppSize.dart';
import 'AppText.dart';
import 'GeneralWidget.dart';

class AppDropList extends StatelessWidget {
  final List<String> listItem;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? dropValue;
  final bool? friezeText;
  final Color? fillColor;
  final Color? borderColor;
  final Widget? prefixIcon;
  final String? labelText;
  final void Function(String?)? onChanged;
  final double? maxHeight;
  final bool? showScrollbar;
  const AppDropList(
      {Key? key,
      required this.listItem,
      required this.validator,
      required this.hintText,
      required this.onChanged,
      required this.dropValue,
      this.friezeText,
      this.fillColor,
      this.prefixIcon,
      this.labelText,
      this.maxHeight,
      this.showScrollbar,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      alignment: Alignment.centerRight,
      value: dropValue,

      dropdownStyleData: DropdownStyleData(
          maxHeight: maxHeight,
          decoration: BoxDecoration(color: AppColor.white)),

      // dropdownMaxHeight: maxHeight,
      // scrollbarAlwaysShow: showScrollbar,
      // itemPadding: EdgeInsets.symmetric(horizontal: 5.w),
      // icon: Icon(
      //   AppIcons.arrowDawn,
      //   size: AppSize.iconsSize,
      //   color: AppColor.black.withOpacity(0.50),
      // ),
      hint: AppText(
        fontSize: AppSize.subTitle,
        text: hintText ?? '',
        color: AppColor.textColor.withOpacity(0.60),
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: AppColor.textColor.withOpacity(0.60),
          fontSize: AppSize.textFieldsHintSize,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
            color: AppColor.textColor, fontSize: AppSize.textFieldsHintSize),
        errorStyle: TextStyle(
            color: AppColor.errorColor,
            fontSize: AppSize.errorSize,
            fontFamily: GoogleFonts.tajawal().fontFamily),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.errorColor, width: 0.5)),
        filled: true,
        fillColor: fillColor ?? AppColor.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.fieldsBorderRadius),
          borderSide: BorderSide(color: AppColor.grey.withOpacity(0.6), width: 0.5
              //AppSize.textFieldsBorderWidth,
              ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.fieldsBorderRadius),
          borderSide: BorderSide(
              color: borderColor ?? AppColor.grey.withOpacity(0.6), width: 0.7),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.fieldsBorderRadius),
          borderSide: BorderSide(color: AppColor.grey.withOpacity(0.6), width: 0.7),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.fieldsBorderRadius),
            borderSide: BorderSide(
                color: AppColor.mainColor.withOpacity(0.3), width: 0.7)),
        // contentPadding: EdgeInsets.only(bottom: 13.h, left: 0.w)
        contentPadding: EdgeInsets.all(AppSize.contentPadding),
      ),
      onChanged: friezeText == true ? null : onChanged,
      items: listItem
          .map((item) => DropdownMenuItem(
                value: item,
                child: AppText(
                  fontSize: AppSize.textFieldsFontSize,
                  text: item,
                  color: AppColor.textColor,
                ),
              ))
          .toList(),
    );
  }
}
