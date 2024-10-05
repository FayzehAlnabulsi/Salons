import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'AppColor.dart';
import 'AppIcons.dart';
import 'AppSize.dart';
import 'AppText.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? isBasic;
  final bool? showBar;
  final bool? centerTitle;
  final bool? showLeftDrawer;
  final Color? backgroundColor;
  final Color? textColor;
  final double? elevation;
  final Function()? onCloseBasic;
  const AppBarWidget({
    Key? key,
    required this.text,
    this.leading,
    this.actions,
    this.isBasic,
    this.showBar,
    this.showLeftDrawer,
    this.backgroundColor,
    this.textColor,
    this.centerTitle,
    this.elevation,
    this.onCloseBasic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: showLeftDrawer == true ? 2 : (elevation ?? 0),
      child: AppBar(
          iconTheme: IconThemeData(
            color: AppColor.white,
            size: 25.r,
          ),
          leadingWidth: 120.w,
          centerTitle: centerTitle ?? true,
          surfaceTintColor: AppColor.white,
          backgroundColor: showBar == false
              ? (backgroundColor ?? AppColor.white)
              : (backgroundColor ?? AppColor.mainColor),
          title: AppText(
            text: text,
            fontSize: AppSize.appBarTextSize,
            color: textColor ?? AppColor.white,
          ),
          leading: isBasic != null && isBasic!
              ? IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    AppIcons.reject,
                    color: AppColor.white,
                    size: AppSize.appBarIconsSize,
                  ),
                  onPressed: onCloseBasic ??
                      () {
                        Navigator.pop(context);
                      },
                )
              : showBar == false
                  ? IconButton(
                      icon: Icon(
                        AppIcons.closeNoCircle,
                        color: AppColor.textColor,
                        size: AppSize.appBarIconsSize,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  : leading,
          actions: actions),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
