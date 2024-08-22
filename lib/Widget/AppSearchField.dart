import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:textfield_search/textfield_search.dart';
import 'AppColor.dart';
import 'AppSize.dart';
import 'AppText.dart';

class AppSearchField extends StatelessWidget {
  final Function future;
  final Function getSelectedValue;
  final TextEditingController textController;
  final String hintText;
  const AppSearchField(
      {Key? key,
      required this.future,
      required this.getSelectedValue,
      required this.textController,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.light(
          primary: AppColor.mainColor,
          background: AppColor.white,
          secondary: AppColor.mainColor,
        ),
      ),
      child: TextFieldSearch(
        future: future,
        getSelectedValue: getSelectedValue,
        scrollbarDecoration: ScrollbarDecoration(
            controller: ScrollController(),
            theme: ScrollbarThemeData(
                thumbVisibility: MaterialStateProperty.all(true),
                thumbColor: MaterialStateProperty.all(AppColor.mainColor))),
        minStringLength: 0,
        decoration: InputDecoration(
          errorStyle: TextStyle(
              color: AppColor.errorColor,
              fontSize: AppSize.textFieldsHintSize,
              fontFamily: GoogleFonts.tajawal().fontFamily),
          labelStyle: TextStyle(
              color: AppColor.textColor, fontSize: AppSize.textFieldsHintSize),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.fieldsBorderRadius),
            borderSide: BorderSide(color: AppColor.grey.withOpacity(0.6), width: 0.8
                //AppSize.textFieldsBorderWidth,
                ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.fieldsBorderRadius),
            borderSide: BorderSide(color: AppColor.grey.withOpacity(0.6), width: 0.8),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.fieldsBorderRadius),
              borderSide: BorderSide(color: AppColor.mainColor, width: 0.5)),
          label: AppText(
            text: hintText,
            fontSize: AppSize.textFieldsHintSize,
          ),
        ),
        label: '',
        textStyle: TextStyle(
            color: AppColor.textColor, fontSize: AppSize.textFieldsHintSize),
        controller: textController,
      ),
    );
  }
}
