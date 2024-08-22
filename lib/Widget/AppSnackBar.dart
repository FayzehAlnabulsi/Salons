import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'AppColor.dart';
import 'AppIcons.dart';
import 'AppSize.dart';
import 'AppText.dart';

class AppSnackBar extends StatelessWidget {
  const AppSnackBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }

  static showInSnackBar(
      {required context,
      required String message,
      required bool isSuccessful,
      Duration? duration,
      double? bottomPadding}) {
    var snackBar = SnackBar(
      content: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColor.white,
              radius: 15.r,
              child: Icon(
                isSuccessful ? AppIcons.success : AppIcons.fail,
                size: AppSize.iconsSize,
                color: isSuccessful
                    ? AppColor.resultSuccess
                    : AppColor.resultFailure,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            SizedBox(
              width: 230.w,
              child: AppText(
                text: message,
                fontSize: AppSize.subSecondaryTitleSize,
                color: AppColor.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: bottomPadding ?? 20.h, right: 20.w, left: 20.w),
      backgroundColor:
          isSuccessful ? AppColor.resultSuccess : AppColor.resultFailure,
      elevation: 20,
      duration: duration ?? const Duration(seconds: 2),
    );
    // Step 3

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
