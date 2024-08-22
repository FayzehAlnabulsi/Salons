import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiselect/multiselect.dart';
import 'AppColor.dart';
import 'AppIcons.dart';
import 'AppSize.dart';
import 'GeneralWidget.dart';

class AppMultiSelect extends StatelessWidget {
  final List itemList;
  final String hintText;
  final IconData? buttonIcon;
  final void Function(List<dynamic>)? onChanged;
  final List? initialValue;
  final String Function(dynamic)? validator;
  final double? height;
  final Color? borderColor;
  final List<dynamic> selectedValue;
  final bool? enabled;
  const AppMultiSelect(
      {Key? key,
      required this.itemList,
      required this.selectedValue,
      required this.hintText,
      this.onChanged,
      this.buttonIcon,
      this.validator,
      this.initialValue,
      this.height,
      this.borderColor,
      this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeBottom: true,
      context: context,
      child: Container(
        height: 45.h,
        decoration: GeneralWidget.decoration(
          radius: 8.r,
          color: AppColor.grey.withOpacity(0.2),
          shadow: true,
          showBorder: true,
          borderColor: borderColor ?? AppColor.black.withOpacity(0.15),
        ),
        child: DropDownMultiSelect(
          onChanged: onChanged ?? (List<dynamic> x) {},
          options: itemList,
          selectedValues: selectedValue,
          whenEmpty: hintText,
          validator: validator,
          enabled: enabled ?? true,
          icon: Icon(
            AppIcons.arrowDawn,
            size: AppSize.iconsSize,
            color: AppColor.black.withOpacity(0.50),
          ),
          decoration: InputDecoration(
              labelStyle: TextStyle(
                  color: AppColor.textColor,
                  fontSize: AppSize.textFieldsHintSize),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w)),
        ),
      ),
    );
  }
}
