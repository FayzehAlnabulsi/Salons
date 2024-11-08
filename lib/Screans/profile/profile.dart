import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:salons/Screans/Account/logIn.dart';
import 'package:salons/Screans/Home/home.dart';
import 'package:salons/Widget/AppColor.dart';
import 'package:salons/Widget/AppIcons.dart';
import 'package:salons/Widget/AppRoutes.dart';
import 'package:salons/Widget/AppSize.dart';
import 'package:salons/Widget/AppText.dart';
import '../../Widget/GeneralWidget.dart';
import '../../Widget/AppMotionNavBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        height: GeneralWidget.height(context),
        width: GeneralWidget.width(context),
        child: Column(
          children: [
            Container(
              height: 250.h,
              width: double.infinity,
              color: AppColor.mainColor,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40.r,
                        backgroundColor: AppColor.white,
                        backgroundImage: Image.network(
                                'https://static.vecteezy.com/system/resources/thumbnails/021/966/428/small_2x/beauty-logo-for-woman-logo-can-be-used-for-beauty-salon-cosmetic-spa-premium-vector.jpg')
                            .image,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      AppText(
                        text: 'Salon Name',
                        fontSize: AppSize.secondaryTitle,
                        color: AppColor.white,
                        textHeight: 1.5,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: AppText(
                          text:
                              'salon description salon description salon description salon description',
                          fontSize: AppSize.subSecondaryTitleSize,
                          color: AppColor.white,
                          align: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Transform.translate(
                      offset: Offset(0, 40.h),
                      child: Container(
                        height: 80.h,
                        margin: EdgeInsets.symmetric(horizontal: 15.w),
                        decoration: GeneralWidget.decoration(
                            color: AppColor.backGroundColor),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  AppIcons.orders,
                                  size: AppSize.iconsSize,
                                  color:
                                      AppColor.lightGreenColor.withOpacity(0.5),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                AppText(
                                  text: 'My orders',
                                  fontSize: AppSize.subSecondaryTitleSize - 2,
                                  color: AppColor.textColor,
                                ),
                                AppText(
                                  text: '300K',
                                  fontSize: AppSize.subSecondaryTitleSize - 2,
                                  color: AppColor.textColor.withOpacity(0.7),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50.h,
                              child: VerticalDivider(
                                color: AppColor.textColor.withOpacity(0.3),
                                thickness: 0.5,
                                width: 50.w,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  AppIcons.like,
                                  size: AppSize.iconsSize,
                                  color:
                                      AppColor.lightGreenColor.withOpacity(0.5),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                AppText(
                                  text: 'Followers',
                                  fontSize: AppSize.subSecondaryTitleSize - 2,
                                  color: AppColor.textColor,
                                ),
                                AppText(
                                  text: '2M',
                                  fontSize: AppSize.subSecondaryTitleSize - 2,
                                  color: AppColor.textColor.withOpacity(0.7),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50.h,
                              child: VerticalDivider(
                                color: AppColor.textColor.withOpacity(0.3),
                                thickness: 0.5,
                                width: 50.w,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  AppIcons.chatSolid,
                                  size: AppSize.iconsSize,
                                  color:
                                      AppColor.lightGreenColor.withOpacity(0.5),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                AppText(
                                  text: 'New chat',
                                  fontSize: AppSize.subSecondaryTitleSize - 2,
                                  color: AppColor.textColor,
                                ),
                                AppText(
                                  text: '3',
                                  fontSize: AppSize.subSecondaryTitleSize - 2,
                                  color: AppColor.textColor.withOpacity(0.7),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 60.h),
                itemCount: accountSalon.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      AppRoutes.pushTo(context, accountSalon[index]['page']);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 30.h,
                          padding: EdgeInsets.only(left: 15.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppText(
                                text: accountSalon[index]['name'].toString(),
                                fontSize: AppSize.subSecondaryTitleSize,
                                color: AppColor.textColor.withOpacity(0.7),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.black.withOpacity(0.15),
                          height: 20.h,
                          thickness: 0.3,
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  List<Map<String, Object>> accountSalon = [
    {'name': 'Salon Information', 'page': Home()},
    {'name': 'Offers', 'page': Home()},
    {'name': 'Discount Coupons', 'page': Home()},
    {'name': 'Settings', 'page': Home()},
    {'name': 'LogOut', 'page': Login()}
  ];

  List<Map<String, Object>> accountUser = [
    {'name': 'Personal Information', 'page': Home()},
    {'name': 'Offers', 'page': Home()},
    {'name': 'Settings', 'page': Home()},
    {'name': 'LogOut', 'page': Login()}
  ];
}
