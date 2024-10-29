import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:salons/Widget/AppIcons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'AppColor.dart';

class AppMotionNavBar extends StatelessWidget {
  final MotionTabBarController? motionTabBarController;
  final Function(int)? onTabItemSelected;

  const AppMotionNavBar({
    super.key,
    required this.motionTabBarController,
    required this.onTabItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return MotionTabBar(
      controller:
          motionTabBarController, // ADD THIS if you need to change your tab programmatically
      initialSelectedTab: AppLocalizations.of(context)!.home,
      labels: [
        AppLocalizations.of(context)!.appointments,
        AppLocalizations.of(context)!.notification,
        AppLocalizations.of(context)!.home,
        AppLocalizations.of(context)!.chat,
        AppLocalizations.of(context)!.profile
      ],
      icons: [
        AppIcons.appointments,
        AppIcons.notification,
        AppIcons.home,
        AppIcons.chat,
        AppIcons.usersDataIcon,
      ],
      tabSize: 45,
      tabBarHeight: 41.h,
      textStyle: TextStyle(
        fontSize: 0.spMin,
        color: AppColor.textColor,
        fontWeight: FontWeight.w500,
      ),
      tabIconColor: AppColor.mainColor,
      tabIconSize: 20.r,
      tabIconSelectedSize: 15.r,
      tabSelectedColor: AppColor.havanaPink,
      tabIconSelectedColor: AppColor.beige,
      tabBarColor: AppColor.backGroundColor,
      onTabItemSelected: onTabItemSelected,
    );
  }
}
