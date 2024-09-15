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
        AppLocalizations.of(context)!.home,
        AppLocalizations.of(context)!.profile
      ],
      icons: [
        AppIcons.ordersManageIcons,
        AppIcons.home,
        AppIcons.usersDataIcon,
      ],
      tabSize: 50,
      tabBarHeight: 50.h,
      textStyle: TextStyle(
        fontSize: 12.spMin,
        color: AppColor.textColor,
        fontWeight: FontWeight.w500,
      ),
      tabIconColor: AppColor.mainColor,
      tabIconSize: 23.r,
      tabIconSelectedSize: 20.r,
      tabSelectedColor: AppColor.havanaPink,
      tabIconSelectedColor: AppColor.beige,
      tabBarColor: AppColor.backGroundColor,
      onTabItemSelected: onTabItemSelected,
    );
  }
}