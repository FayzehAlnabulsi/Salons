import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'AppColor.dart';

class AppBottomSheet {
  static showBottomSheet(
      {required context,
      required Widget child,
      Function(dynamic)? then,
      bool isScrollControlled = true,
      Color? backgroundColor}) {
    return showModalBottomSheet(
        backgroundColor: backgroundColor ?? AppColor.white,
        isScrollControlled: isScrollControlled,
        context: context,
        builder: (_) {
          return child;
        }).then(then ?? (value) => null);
  }
}
