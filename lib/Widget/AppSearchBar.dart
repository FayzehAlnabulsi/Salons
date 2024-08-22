import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'AppColor.dart';
import 'AppMessage.dart';
import 'AppTextFields.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? label;
  final bool? enable;
  final void Function()? onTap;
  const AppSearchBar(
      {super.key,
      this.controller,
      this.onChanged,
      this.label,
      this.onTap,
      this.enable});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.spMin,
      child: AppTextFields(
        borderColor: AppColor.mainColor,
        fillColor: AppColor.transparent,
        focusedColor: AppColor.mainColor,
        validator: (v) {},
        onChanged: onChanged,
        onTap: onTap,
        enable: enable ?? true,
        controller: controller,
        textInputAction: TextInputAction.search,
        hintText: label ?? AppMessage.search,
        inputFormatters: [
          // This formatter allows Arabic and English characters (both upper and lower case),
          // spaces, and digits.
          FilteringTextInputFormatter.allow(
              RegExp(r'[a-zA-Z\u0600-\u06FF\d\s]')),
        ],
      ),
    );
  }
}
