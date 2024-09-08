import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'AppButtons.dart';
import 'AppColor.dart';
import 'AppIcons.dart';
import 'AppMessage.dart';
import 'AppPath.dart';
import 'AppSize.dart';
import 'AppText.dart';
import 'GeneralWidget.dart';

class AppDialog {
  static showLoading({required context}) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            titlePadding: EdgeInsets.zero,
            elevation: 0,
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            content: UnconstrainedBox(
              child: Container(
                height: 150.h, width: 150.h,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.all(Radius.circular(200.r))),
                alignment: AlignmentDirectional.topCenter,
                child: Lottie.asset(AppPath.loading, fit: BoxFit.cover, alignment: Alignment.topCenter),
              ),
            ),
          );
        });
  }

  ///=================================================================================
  static showResult({
    required context,
    required String title,
    required String message,
    required bool isSuccessful,
    required Function()? function,
    bool showSecondButton = false,
    double? buttonWidth,
    String? buttonLabel,
    void Function()? secondFunction,
    double? secondButtonWidth,
    String? secondButtonLabel,
  }) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,

            // shape: const RoundedRectangleBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(10))),
            titlePadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            elevation: 0,
            content: UnconstrainedBox(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.r))),
                width: MediaQuery.of(context).size.width / 1.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 140.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColor.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.r),
                                  topRight: Radius.circular(15.r),
                                  bottomLeft: Radius.circular(120.r),
                                  bottomRight: Radius.circular(120.r))),
                          child: Center(
                            child: CircleAvatar(
                                backgroundColor: AppColor.black,
                                radius: 33.r,
                                child: CircleAvatar(
                                    backgroundColor: isSuccessful
                                        ? AppColor.resultSuccess
                                        : AppColor.resultFailure,
                                    radius: 30.r,
                                    child: Icon(
                                        isSuccessful
                                            ? AppIcons.success
                                            : AppIcons.fail,
                                        size: 25.r))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.h),
                          child: AppText(
                              text: title,
                              fontSize: AppSize.secondaryTitle,
                              color: AppColor.black,
                              align: TextAlign.center,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          child: AppText(
                              text: message,
                              fontSize: AppSize.subTitle,
                              color: AppColor.black.withOpacity(0.50),
                              align: TextAlign.center),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.r, vertical: 25.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppButtons(
                            onPressed: function,
                            text: buttonLabel ?? 'حسنا',
                            width: buttonWidth ??
                                (showSecondButton ? 100.w : 120.w),
                            height: 40.h,
                            elevation: 3,
                            backgroundColor: isSuccessful
                                ? AppColor.resultSuccess
                                : AppColor.resultFailure,
                            textStyleWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: showSecondButton ? 10.w : 0,
                          ),
                          showSecondButton
                              ? AppButtons(
                                  onPressed: secondFunction,
                                  text: secondButtonLabel ?? 'إلغاء',
                                  width: secondButtonWidth ?? 100.w,
                                  height: 40.h,
                                  elevation: 3,
                                  backgroundColor:
                                      AppColor.black.withOpacity(0.50),
                                  textStyleWeight: FontWeight.bold,
                                )
                              : const SizedBox()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  ///=================================================================================
  static FutureOr<bool?> confirmDialog({
    required BuildContext context,
    required String title,
    required onPressedYes,
    required onPressedNo,
    String? content,
    String? yesText,
    String? noText,
    Color? yesColor,
    Color? noColor,
    Color? yesTextColor,
    Color? noTextColor,
    TextAlign? align,
    EdgeInsetsGeometry? actionsPadding,
    Widget? contentWidget,
    CrossAxisAlignment? crossAxisAlignment,
    then, // Ensure that then is a function
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.spMin))),
          titlePadding: EdgeInsets.zero,
          actionsPadding: actionsPadding,
          title: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(15.spMin),
            decoration: BoxDecoration(
              color: AppColor.mainColor.withOpacity(0.80),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: AppText(
                fontSize: AppSize.labelSize,
                text: title,
                fontWeight: FontWeight.bold,
                color: AppColor.white,
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: AppText(
                    fontSize: AppSize.labelSize,
                    text: content ?? AppMessage.confirmDelete,
                    align: align,
                  ),
                ),
                contentWidget ?? const SizedBox(),
              ],
            ),
          ),
          actions: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: AppButtons(
                    textStyleColor: yesTextColor,
                    height: 40.h,
                    onPressed: onPressedYes,
                    text: yesText ?? AppMessage.yes,
                    backgroundColor: yesColor ?? AppColor.errorColor,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Flexible(
                  child: AppButtons(
                    textStyleColor: noTextColor,
                    height: 40.h,
                    onPressed: onPressedNo,
                    text: noText ?? AppMessage.no,
                    backgroundColor: noColor ?? AppColor.grey.withOpacity(0.2),
                  ),
                )
              ],
            )
          ],
        );
      },
    ).then((value) => then?.call()); // Call the function only if it's not null
  }

  ///=================================================================================
  static FutureOr<bool?> viewDialog(
      {required context,
      required Widget child,
      bool? showCloseBar,
      String? closeBarTitle,
      height,
      dialogPadding,
      width,
      barrierDismissible,
      onClose,
      contentPadding,
      CrossAxisAlignment? crossAxisAlignment}) {
    return showDialog(
        barrierDismissible: barrierDismissible ?? false,
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: dialogPadding ?? EdgeInsets.all(20.r),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r))),
            titlePadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            elevation: 3,
            title: showCloseBar != null && showCloseBar
                ? Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: GeneralWidget.decoration(
                        color: AppColor.mainColor.withOpacity(0.80),
                        radius: 10,
                        radiusOnlyTop: true),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: closeBarTitle ?? '',
                          fontSize: AppSize.labelSize,
                          color: AppColor.white,
                        ),
                        InkWell(
                            onTap: onClose ??
                                () {
                                  Navigator.pop(context);
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                            child: Icon(
                              AppIcons.close,
                              size: AppSize.appBarIconsSize,
                              color: AppColor.white,
                            ))
                      ],
                    ),
                  )
                : null,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Padding(
                    padding: contentPadding ??
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                    child: child,
                  ),
                ),
              ],
            ),
          );
        }).then((v) {
      onClose;
    });
  }
}
