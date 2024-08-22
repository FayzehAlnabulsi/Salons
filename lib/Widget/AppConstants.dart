import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'GeneralWidget.dart';
import 'ItemShape.dart';

class AppConstants {
  static BuildContext? context;
  AppConstants();
  static const String appDomain = 'https://app.celebrity.sa';
  static const Duration timeOut = Duration(seconds: 15);
  static const Duration searchTime = Duration(milliseconds: 1500);
  static const String filter = 'filter';
  static const String search = 'search';
  static const String original = 'original';
  static const bytesToMB = 0.000001;
  static const int limit = 2;
  //live stream keys ==================================================================
  static const int streamAppId = 806777921;
  static const String streamSignId =
      "ed0771a4be9a04db38358fba71d538b2e9866381b43d7b1422897b71875110a9";
  static const String serverSecretKey = "1f3c6c398b822371899458ac48a6eac6";

  ///======================================================
  ///not chang id or resort item=>using in page-view
  static const int celebrityId = 0;
  static const int alertsId = 1;
  static const int documentationId = 2;
  static const int usersDataId = 3;
  static const int documentationUserId = 4;
  static const int requestId = 5;
  static const int reportsReportsId = 6;
  static const int rejectReasonsId = 7;
  static const int livesId = 8;
  static const int specialLivesId = 9;
  static const int liveWarningsId = 10;
  static const int supportId = 11;
  static const int settingsId = 12;
  static const int logOutId = 13;

  ///main section menu-------------------
  static const int celebritySectionId = 14;
  static const int userSectionId = 15;
  static const int liveSectionId = 16;

  //=======================================================================

  static const int statusNew = 1;
  static const int statusVerify = 2;
  static const int statusReject = 3;
  static const int rejectOperation = 1;
  static const int acceptOperation = 2;

//==============================================================================
  static const List<String> videoExtension = [
    '.mp4',
    '.mov',
  ];
  static const List<String> imageExtension = [
    '.png',
    '.jpg',
    '.jpeg',
  ];

  ///=======================+++++++++++++++================================
  static List<ItemShape> merchantShapeList = [
    ItemShape(
        high: GeneralWidget.height(context) * 0.66,
        width: double.infinity,
        margin: EdgeInsets.only(top: 0.h, left: 10.w, right: 10.w),
        borderRadius: BorderRadius.all(Radius.circular(5.r))),
  ];

  ///=======================+++++++++++++++================================
  static List<ItemShape> tableLode = [
    ItemShape(
        high: 40.h,
        width: double.infinity,
        borderRadius: BorderRadius.all(Radius.circular(0.r))),
  ];
  static List<ItemShape> statusFilterLode = [
    ItemShape(
        high: 10.h,
        width: 120.w,
        borderRadius: BorderRadius.all(Radius.circular(5.r))),
    ItemShape(
        high: 10.h,
        width: 120.w,
        borderRadius: BorderRadius.all(Radius.circular(5.r))),
    ItemShape(
        high: 10.h,
        width: 120.w,
        borderRadius: BorderRadius.all(Radius.circular(5.r))),
  ];

  ///=======================+++++++++++++++================================
  static List<ItemShape> cardLode = [
    ItemShape(
        margin: EdgeInsets.only(bottom: 10.h),
        high: 120.h,
        width: double.maxFinite,
        borderRadius: BorderRadius.all(Radius.circular(5.r))),
    ItemShape(
        margin: EdgeInsets.only(bottom: 10.h),
        high: 120.h,
        width: double.maxFinite,
        borderRadius: BorderRadius.all(Radius.circular(5.r))),
    ItemShape(
        margin: EdgeInsets.only(bottom: 10.h),
        high: 120.h,
        width: double.maxFinite,
        borderRadius: BorderRadius.all(Radius.circular(5.r))),
    ItemShape(
        margin: EdgeInsets.only(bottom: 10.h),
        high: 120.h,
        width: double.maxFinite,
        borderRadius: BorderRadius.all(Radius.circular(5.r))),
  ];
}
