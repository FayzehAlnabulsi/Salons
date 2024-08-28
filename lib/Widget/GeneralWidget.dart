import 'dart:io';
import 'dart:math';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:open_app_file/open_app_file.dart';
import 'AppColor.dart';
import 'AppConstants.dart';
import 'AppIcons.dart';
import 'AppMessage.dart';
import 'AppPath.dart';
import 'AppSize.dart';
import 'AppSvg.dart';
import 'AppText.dart';

typedef RefreshUi = VoidCallback;

class GeneralWidget {
  static double width(context) => MediaQuery.of(context).size.width;
  static double height(context) => MediaQuery.of(context).size.height;
//scroll body===========================================================
  static Widget body({required Widget? child, ScrollPhysics? physics}) {
    return LayoutBuilder(builder: ((context, constraints) {
      return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification? overscroll) {
          overscroll!.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
            physics: physics ?? const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: IntrinsicHeight(child: child),
            )),
        //)
      );
// AppText(text: LocaleKeys.myTeam.tr(), fontSize: WidgetSize.titleTextSize);
    }));
  }

//borderStyle===============================================================================================
  static outlineInBorderStyle({bool? isFocus}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.textFieldsBorderRadius),
      borderSide: BorderSide(
        color: isFocus == true
            ? AppColor.subColor
            : AppColor.grey.withOpacity(0.6),
        width: AppSize.textFieldsBorderWidth,
      ),
    );
  }

//borderStyle for check drop dawn list===============================================================================================
  static containerBorderStyle({double? radius, Color? borderColor}) {
    return BoxDecoration(
      borderRadius:
          BorderRadius.circular(radius ?? AppSize.textFieldsBorderRadius),
      border: Border.all(
        color: borderColor ?? AppColor.grey.withOpacity(0.6),
        width: AppSize.textFieldsBorderWidth,
      ),
      color: AppColor.white,
    );
  }

//===============================================================================================
  static List<PopupMenuItem> itemList({required action}) {
    return [
      PopupMenuItem(
        padding: EdgeInsets.zero,
        child: ListTile(
          // leading: Icon(
          //   AppIcons.profile,
          //   color: AppColor.white,
          // ),
          title: AppText(
            text: 'Home page',
            fontSize: AppSize.subSecondaryTitleSize,
            color: AppColor.white,
          ),
        ),
      ),
      PopupMenuItem(
          child: Divider(
        color: AppColor.white,
        thickness: 1,
      )),
      //====================================
      PopupMenuItem(
        child: ListTile(
          onTap: action,
          // leading: Icon(
          //   AppIcons.logout,
          //   color: AppColor.white,
          // ),
          title: AppText(
            text: 'Log out',
            fontSize: AppSize.subSecondaryTitleSize,
            color: AppColor.white,
          ),
        ),
      ),
    ];
  }

  //======================random number=======================================
  static String randomNumber(int length) {
    const characters = '0123456789';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(length,
        (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  }

//==================random upper char=============================================
  static String randomUpper(int length) {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(length,
        (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  }

//==================random lower char=============================================
  static String randomLower(int length) {
    const characters = 'abcdefghijklmnopqrstuvwxyz';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(length,
        (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  }

//==================random char=============================================
  static String randomCode(int length) {
    const characters = '#%^*_-!';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(length,
        (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  }

  //======================checkBox tile ===========================

  static Widget checkBoxTile(
      {required bool? value,
      required void Function(bool?)? onChange,
      Widget? title,
      bool? dense,
      EdgeInsetsGeometry? contentPadding}) {
    return Theme(
      data: ThemeData.dark(),
      child: CheckboxListTile(
          dense: dense,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: contentPadding??EdgeInsets.all(0.r),
          value: value,
          title: title,
          activeColor: AppColor.mainColor,
          onChanged: onChange),
    );
  }

  //=========================text span ========================

  static TextSpan textSpan(
      {text, textColor, double? textSize, onTap, children, fontWeight}) {
    return TextSpan(
        recognizer: TapGestureRecognizer()..onTap = onTap,
        text: text,
        children: children ?? null,
        style: TextStyle(
            height: 1.25.h,
            color: textColor,
            fontSize: textSize,
            fontWeight: fontWeight,
            fontFamily: GoogleFonts.tajawal().fontFamily));
  }

  //======================= container with border =======================

  static Widget containerWithBorder(
      {required Widget child,
      width,
      margin,
      borderColor,
      onTap,
      height,
      backgroundColor,
      padding,
      double borderThickness = 1.0,
      double? borderRadius,
      AlignmentGeometry? alignment,
      bool? showHeight,
      BoxDecoration? decoration}) {
    return InkWell(
      onTap: onTap,
      child: Container(
          alignment: alignment,
          width: width ?? double.infinity,
          margin: margin ?? EdgeInsets.zero,
          padding: padding ?? EdgeInsets.zero,
          height: showHeight == true ? height : (height ?? 45.h),
          decoration: decoration ??
              BoxDecoration(
                color: backgroundColor,
                border: Border.all(
                  color: borderColor ?? AppColor.grey.withOpacity(0.6),
                  width: borderThickness,
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
              ),
          child: child),
    );
  }

//===================================================================================================================
  static Widget intrinsicWidthListTile(
      {required String subtitle,
      required String title,
      IconData? icon,
      bool showCircleAvatar = true,
      bool showShadow = true,
      Color? iconColor,
      Widget? avatar,
      Widget? child}) {
    return IntrinsicWidth(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        boxShadow: showShadow == false
            ? null
            : [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(0.0, 1.0),
                  blurRadius: 6.0,
                ),
              ],
      ),
      child: child ??
          ListTile(
            title: AppText(
              text: title,
              fontSize: AppSize.labelSize,
              fontWeight: FontWeight.bold,
            ),
            subtitle:
                AppText(text: subtitle, fontSize: AppSize.textFieldsHintSize),
            leading: showCircleAvatar
                ? CircleAvatar(
                    backgroundColor: AppColor.subColor,
                    child: avatar ??
                        Icon(
                          icon!,
                          size: AppSize.iconsSize,
                          color: AppColor.white,
                        ),
                  )
                : Icon(
                    icon,
                    size: AppSize.iconsSize,
                    color: iconColor,
                  ),
          ),
    ));
  }

//======================================================================================
  static BoxDecoration decoration({
    bool? shadow,
    bool? radiusOnlyTop,
    bool? radiusOnlyBottom,
    bool? radiusOnlyTopLeftButtomLeft,
    bool? radiusOnlyTopRightButtomRight,
    Color? color,
    double radius = 10,
    bool showBorder = false,
    Color? borderColor,
    double borderWidth = 0.5,
    ImageProvider<Object>? image,
    bool cover = false,
    ColorFilter? colorFilter,
    bool isGradient = false,
    Color? shadowColor,
  }) {
    return BoxDecoration(
        image: image == null
            ? null
            : DecorationImage(
                image: image,
                fit: cover == true ? BoxFit.cover : BoxFit.contain,
                colorFilter: colorFilter),
        border: showBorder == true
            ? Border.all(
                color: borderColor ?? AppColor.grey.withOpacity(0.6),
                width: borderWidth)
            : null,
        color: isGradient == true ? null : (color ?? AppColor.white),
        borderRadius: radiusOnlyTop == true
            ? BorderRadius.only(
                topRight: Radius.circular(radius.r),
                topLeft: Radius.circular(radius.r),
              )
            : radiusOnlyBottom == true
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(radius.r),
                    bottomRight: Radius.circular(radius.r))
                : radiusOnlyTopLeftButtomLeft == true
                    ? BorderRadius.only(
                        topLeft: Radius.circular(radius.r),
                        bottomLeft: Radius.circular(radius.r),
                      )
                    : radiusOnlyTopRightButtomRight == true
                        ? BorderRadius.only(
                            topRight: Radius.circular(radius.r),
                            bottomRight: Radius.circular(radius.r))
                        : BorderRadius.all(Radius.circular(radius.r)),
        boxShadow: shadow == null || shadow == false
            ? [
                BoxShadow(
                  color: shadowColor ?? Colors.grey.withOpacity(0.1),
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: const Offset(0, 0),
                ),
              ]
            : null,
        gradient: isGradient
            ? LinearGradient(colors: [
                AppColor.mainColor,
                AppColor.subColor,
              ])
            : null);
  }

  //==============================================================
  static imageError() {
    return Image.asset(AppPath.logo);
  }

//==============================================================
  static AssetImage placeholderImage({image}) {
    return AssetImage(image ?? AppPath.logo);
  }

//auto Scroll list============================================================
  static autoScrollListView(
      {required ScrollController scrollController,
      required int listLength,
      required int goToIndex}) {
    final contentSize = scrollController.position.viewportDimension +
        scrollController.position.maxScrollExtent;

    final target = contentSize * goToIndex / listLength;
    scrollController.position.animateTo(target,
        curve: Curves.ease, duration: const Duration(milliseconds: 300));
  }

//=========================================================================
  static Future<void> ensureVisibleOnTextArea({required GlobalKey key}) async {
    final keyContext = key.currentContext;
    if (keyContext != null) {
      await Future.delayed(const Duration(milliseconds: 500)).then(
        (value) => Scrollable.ensureVisible(
          keyContext,
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
        ),
      );
    }
  }

  //========================================================================
  static Widget closeBox(
      {required BuildContext context,
      Color? color,
      Color? iconColor,
      EdgeInsetsGeometry? margin}) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: GeneralWidget.decoration(
          color: color ?? AppColor.mainColor,
        ),
        margin: margin,
        width: 40.spMin,
        height: 40.spMin,
        child: Icon(
          AppIcons.closeNoCircle,
          color: iconColor ?? AppColor.white,
          size: AppSize.appBarIconsSize,
        ),
      ),
    );
  }

//=============================================================================
  static Widget gradientContainer(
      {required String text,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding}) {
    return Container(
      alignment: AlignmentDirectional.center,
      width: double.maxFinite,
      decoration: decoration(shadow: false, isGradient: true),
      padding: padding ??
          EdgeInsets.only(top: 25.h, bottom: 25.h, left: 10.w, right: 10.w),
      margin: margin,
      child: AppText(
        text: text,
        fontSize: AppSize.titleSize,
        color: AppColor.white,
        fontWeight: FontWeight.bold,
        align: TextAlign.center,
      ),
    );
  }

  //calender them=============================================================================================
  static them({required BuildContext context, required Widget child}) {
    return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColor.mainColor,
            onPrimary: AppColor.white,
            onBackground: AppColor.subColor,
            primaryContainer: AppColor.mainColor,
            background: AppColor.white,
            // header text color// body text color
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColor.mainColor, // button text color
            ),
          ),
        ),
        child: child);
  }

  ///==================================================================================================
  static Widget emptyData({required BuildContext context, String? lottieFile}) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSvg(
            path: AppPath.empty,
            height: 200.h,
          ),
          SizedBox(
            height: 50.h,
          ),
          Transform.translate(
              offset: Offset(0, -40.h),
              child:
                  AppText(text: AppMessage.noData, fontSize: AppSize.labelSize))
        ],
      ),
    );
  }

  ///===============================================================================
  static Future<List<DateTime?>?> showDateRangDialog(
      {required BuildContext context,
      DateTime? startDate,
      Function()? onClose,
      String? closeText}) async {
    List<DateTime?>? results = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        currentDate: DateTime.now(),
        firstDate: startDate,
        calendarType: CalendarDatePicker2Type.range,
        selectedDayTextStyle:
            TextStyle(color: AppColor.white, fontWeight: FontWeight.w700),
        selectedDayHighlightColor: AppColor.mainColor,
        centerAlignModePicker: true,
        cancelButton: InkWell(
          onTap: onClose ??
              () {
                Navigator.pop(context);
              },
          child: AppText(
            text: closeText ?? 'الغاء',
            fontSize: AppSize.labelSize,
            color: AppColor.mainColor,
          ),
        ),
        okButton: AppText(
          text: 'تأكيد',
          fontSize: AppSize.labelSize,
          color: AppColor.mainColor,
        ),
      ),
      dialogSize: Size(325.w, 400.h),
      borderRadius: BorderRadius.circular(15.r),
    );
    return results;
  }

  ///=============================================================================================
  static Future<DateTime?> showDateDialogue({
    required context,
    required DateTime initialDate,
    required String hint,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    return await showDatePicker(
        context: context,
        initialDate: initialDate, //get today's date
        firstDate: firstDate ??
            DateTime
                .now(), //DateTime.now() - not to allow to choose before today.
        lastDate: lastDate ?? DateTime(2101),
        helpText: hint,
        cancelText: 'الغاء',
        confirmText: "اختيار",
        fieldLabelText: 'التاريخ',
        // locale: const Locale("ar", "AR"),
        builder: (cont, child) {
          return GeneralWidget.them(context: context, child: child!);
        });
  }

  ///convert date to string===========================================================================================
  static convertStringToDate(DateTime? dateTime) {
    return '${dateTime?.day.toString().padLeft(2, '0')} '
        '${convertMonth(dateTime!.month)} '
        '${dateTime.year}';
  }

  ///convert date and time to string===========================================================================================
  static convertStringToDateAndTime(DateTime? dateTime) {
    return '${dateTime!.hour.toString().padLeft(2, '0')}:'
        '${dateTime.minute.toString().padLeft(2, '0')}'
        ' ${dateTime.year}-'
        '${convertMonth(dateTime.month)}-'
        '${dateTime.day.toString().padLeft(2, '0')}';
  }

  static String convertMonth(int month) {
    switch (month) {
      case 1:
        return 'يناير';
      case 2:
        return 'فبراير';
      case 3:
        return 'مارس';
      case 4:
        return 'أبريل';
      case 5:
        return 'مايو';
      case 6:
        return 'يونيو';
      case 7:
        return 'يوليو';
      case 8:
        return 'أغسطس';
      case 9:
        return 'سبتمبر';
      case 10:
        return 'أكتوبر';
      case 11:
        return 'نوفمبر';
      default:
        return 'ديسمبر';
    }
  }

  ///==========================================================================
  static void getSelectedValues(
      {required bool isSelect,
      required dynamic item,
      required List list,
      required RefreshUi refreshUi}) {
    if (isSelect == true) {
      list.add(item);
      refreshUi();
    } else {
      list.remove(item);
      refreshUi();
    }
  }

  //==================================================================================
  static upperTextWithWidget({
    String? body,
    String? label,
    Widget? customBody,
    Widget? customLabel,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: customLabel ?? AppText(text: label!, fontSize: AppSize.labelSize),
      subtitle: customBody ??
          Container(
              padding: EdgeInsets.all(10.spMin),
              width: double.maxFinite,
              decoration: GeneralWidget.containerBorderStyle(),
              child: AppText(
                  text: body!,
                  color: AppColor.textColor,
                  fontSize: AppSize.textFieldsHintSize)),
    );
  }

  //=================================================================================
  static containerWithBorderAndRowChild(
      {required String leading,
      required String trailing,
      Color? backgroundColor,
      margin,
      padding,
      double? height,
      int leadingFlex = 2,
      Color? trailingColor,
      bool showIcon = false,
      IconData? icon,
      Color? iconColor,
      bool showTrailing = true,
      bool showSpaceAfterLeading = true,
      bool removeBodyPadding = false,
      Color? borderColor,
      TextDirection? textDirection,
      dynamic onTap,
      Widget? customLeading}) {
    return containerWithBorder(
      onTap: onTap,
      backgroundColor: backgroundColor,
      borderColor: borderColor ?? AppColor.grey.withOpacity(0.6),
      margin: margin ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
      padding: padding ?? EdgeInsets.only(right: 10.w),
      borderRadius: 3.5.r,
      borderThickness: 0.5,
      height: height,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
//leading=========================================================================================================
          Flexible(
            flex: leadingFlex,
            child: Row(children: [
              Visibility(
                visible: showIcon,
                child: Icon(
                  icon,
                  size: AppSize.iconsSize,
                  color: iconColor ?? AppColor.textColor,
                ),
              ),
              Visibility(
                  visible: showIcon,
                  child: SizedBox(
                    width: 10.w,
                  )),
              Flexible(
                child: customLeading ??
                    AppText(
                      fontSize: AppSize.smallTextSize,
                      text: leading,
                      overflow: TextOverflow.ellipsis,
                      textDirection: textDirection,
                    ),
              ),
            ]),
          ),
          SizedBox(
            width: showSpaceAfterLeading ? 10.w : 0,
          ),

//trailing=========================================================================================================
          showTrailing == false
              ? const SizedBox()
              : Flexible(
                  child: Container(
                    padding: EdgeInsets.all(5.spMin),
                    decoration: decoration(
                        radius: 3.r,
                        shadow: false,
                        color: trailingColor ?? AppColor.secondaryColor,
                        radiusOnlyTopLeftButtomLeft: true),
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Center(
                      child: AppText(
                        color: AppColor.black,
                        fontSize: AppSize.smallTextSize,
                        text: trailing,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  ///=================================================================================================================
  static Widget customWidget(
      {required String text,
      Function()? onTap,
      width,
      required Color bacColor}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(minWidth: 80.w),
        padding: EdgeInsets.all(10.spMin),
        decoration: GeneralWidget.decoration(
            radius: 8, shadow: false, color: bacColor.withOpacity(0.13)),
        child: AppText(
          text: text,
          fontSize: AppSize.smallTextSize,
          color: bacColor,
          fontWeight: FontWeight.bold,
          align: TextAlign.center,
        ),
      ),
    );
  }

  ///========================================
  static backgroundImage({
    required String image,
    bool isNetworkImage = true,
    double? height,
    double? width,
  }) {
    return FadeInImage(
      height: height ?? 190.h,
      width: width ?? double.infinity,
      image: isNetworkImage
          ? NetworkImage(image)
          : AssetImage(image) as ImageProvider,
      placeholderFit: BoxFit.cover,
      placeholder: GeneralWidget.placeholderImage(),
      imageErrorBuilder: (context, error, stackTrace) =>
          GeneralWidget.imageError(),
      fit: BoxFit.contain,
    ).image;
  }

  ///lode data shape================================================================================
  static lodeWidget({required BuildContext context, listName}) {
    return Container(
      padding: EdgeInsets.only(right: 2.w, top: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          AppText(
              text: listName,
              fontSize: AppSize.subTitle,
              color: AppColor.black,
              fontWeight: FontWeight.bold),
          SizedBox(
            height: 10.h,
          ),
          getRowLode(context),
          SizedBox(
            height: 10.h,
          ),
          getRowLode(context),
          SizedBox(
            height: 10.h,
          ),
          getRowLode(context),
        ],
      ),
    );
  }

  static getRowLode(context) {
    return Row(
      children: [
        Container(
          height: 20.spMin,
          width: 20.spMin,
          decoration: decoration(
              shadow: false, radius: 2, color: AppColor.grey.withOpacity(0.6)),
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          height: 20.spMin,
          width: width(context) * 0.38,
          decoration: decoration(
              shadow: false, radius: 4, color: AppColor.grey.withOpacity(0.6)),
        ),
      ],
    );
  }

  /// ==============================================================================================================================================================
  static errorWidget(
      {required BuildContext context, required String listName}) {
    return Container(
      padding: EdgeInsets.only(right: 2.w, top: 2.h),
      alignment: AlignmentDirectional.topStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          AppText(
              text: listName,
              fontSize: AppSize.subTitle,
              color: AppColor.black,
              fontWeight: FontWeight.bold),
          SizedBox(
            height: 10.h,
          ),
          AppText(
              text: AppMessage.listError,
              fontSize: AppSize.subSecondaryTitleSize)
        ],
      ),
    );
  }

//=============================================================
  static List<TextSpan> highlightText(
      {required String originalText, required String query}) {
    List<TextSpan> spans = [];
    // If the search text is empty, simply return the text without highlighting.
    if (query.isEmpty) {
      spans.add(TextSpan(text: originalText));
    } else {
      // If the search text is not empty, create a regular expression to find matches.
      RegExp regex = RegExp(query, caseSensitive: false);
      Iterable<Match> matches = regex.allMatches(originalText);

      // Iterate through matches and highlight them.
      int lastMatchEnd = 0;
      for (Match match in matches) {
        if (match.start > lastMatchEnd) {
          // Add non-matching text before the current match.
          spans.add(
            TextSpan(
              text: originalText.substring(lastMatchEnd, match.start),
            ),
          );
        }
        // Add the matching text with custom style (highlighted in red).
        spans.add(
          TextSpan(
            text: originalText.substring(match.start, match.end),
            style: AppText.styleText(
              color: AppColor.errorColor,
              fontSize: AppSize.subTitle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
        lastMatchEnd = match.end;
      }
      // Add any remaining text after the last match.
      if (lastMatchEnd < originalText.length) {
        spans.add(
          TextSpan(
            text: originalText.substring(lastMatchEnd, originalText.length),
          ),
        );
      }
    }

    return spans;
  }

  /// ==============================================================================================================================================================

  static Future openPdf(File file) async {
    final url = file.path;
    await OpenAppFile.open(url);
  }

  //========================================================================================
  static bool isFileLimitReached({required File file}) {
    num size = file.lengthSync() * AppConstants.bytesToMB;
    if (size > AppConstants.limit) {
      return true;
    }
    return false;
  }

//===========================================================
  static String getValidationMessage(Map<String, dynamic> message) {
    if (message['en'] != "The email format is incorrect." &&
        message['en']['email']?[0] == "The email has already been taken." &&
        message['en']['username']?[0] ==
            "The username has already been taken.") {
      return AppMessage.emailAndUsernameTaken;
    } else if (message['en'] != "The email format is incorrect." &&
        message['en']['username']?[0] ==
            "The username has already been taken.") {
      return AppMessage.usernameTaken;
    } else if (message['en'] != "The email format is incorrect." &&
        message['en']['email']?[0] == "The email has already been taken.") {
      return AppMessage.emailTaken;
    } else if (message['en'] == "The email format is incorrect.") {
      return AppMessage.invalidEmailFormat;
    } else if (message['en']?["phonenumber"]?[0] ==
        "The phonenumber has already been taken.") {
      return AppMessage.phoneNumberTaken;
    } else if (message['en']?["full_name"]?[0] ==
        "The provided name is blocked.") {
      return AppMessage.fullNameBlocked;
    } else if (message['en']?["name"]?[0] == "The provided name is blocked.") {
      return AppMessage.nameBlocked;
    } else if (message['en']?["name"]?[0] == "The name format is invalid.") {
      return AppMessage.invalidNameFormat;
    } else {
      return AppMessage.serverText;
    }
  }

  static Future<DateTime?> showDateTimePicker(
      {required context, DateTime? initialDate, DateTime? startDate}) async {
    DateTime? dateTime = await showOmniDateTimePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate:
          startDate ?? DateTime(1600).subtract(const Duration(days: 3652)),
      lastDate: DateTime.now().add(
        const Duration(days: 3652),
      ),
      is24HourMode: false,
      isShowSeconds: false,
      minutesInterval: 1,
      secondsInterval: 1,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 650,
      ),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(
            Tween(
              begin: 0,
              end: 1,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
    );
    return dateTime;
  }
}
