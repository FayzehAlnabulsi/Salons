import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masonry_list_view_grid/masonry_list_view_grid.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:salons/Widget/AppBar.dart';
import 'package:salons/Widget/AppColor.dart';
import 'package:salons/Widget/AppSize.dart';
import 'package:salons/Widget/AppText.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Widget/AppIcons.dart';
import '../../Widget/AppPath.dart';
import '../../Widget/GeneralWidget.dart';
import '../../Widget/AppMotionNavBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      appBar: AppBarWidget(
        text: '',
        elevation: 1,
        leading: Image.asset(AppPath.logo),
        backgroundColor: AppColor.backGroundColor,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  AppIcons.search,
                  color: AppColor.mainColor,
                  size: AppSize.iconsSize,
                )),
          )
        ],
      ),
      body: Container(
        alignment: AlignmentDirectional.center,
        height: GeneralWidget.height(context),
        width: GeneralWidget.width(context),
        padding: EdgeInsets.zero,
        child: ListView(
          children: [
            SizedBox(
              height: 130.h,
              child: ListView.builder(
                itemCount: 5,
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.r),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 41.r,
                              backgroundColor: AppColor.havanaPink,
                              child: CircleAvatar(
                                radius: 38.r,
                                backgroundColor: AppColor.backGroundColor,
                                child: CircleAvatar(
                                  radius: 35.r,
                                  backgroundColor: AppColor.secondaryColor,
                                ),
                              ),
                            ),
                            Visibility(
                                visible: index == 0,
                                child: CircleAvatar(
                                  radius: 12.r,
                                  backgroundColor: AppColor.white,
                                  child: Icon(
                                    AppIcons.addCircle,
                                    color: AppColor.lightGreenColor,
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        AppText(text: 'salons', fontSize: AppSize.subTitle)
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 145.h,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.havanaPink,
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: SmoothPageIndicator(
                          controller: PageController(), // PageController
                          count: 3,
                          effect: WormEffect(
                              dotColor: AppColor.textColor,
                              dotHeight: 8.h,
                              dotWidth: 8.w,
                              activeDotColor:
                                  AppColor.beige), // your preferred effect
                          onDotClicked: (index) {}),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: GeneralWidget.height(context) * (50 / 5.8),
              child: MasonryListViewGrid(
                column: 2,
                crossAxisGap: 3,
                mainAxisGap: 3,
                scrollToTopBgColor: AppColor.havanaPink,
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                children: List.generate(
                  50,
                  (index) => Container(
                    decoration: BoxDecoration(
                        color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10.r)),
                    height: (150 + (index % 3 == 0 ? 250 : 150)).toDouble(),
                    child: Center(
                      child: Text('Child ${index + 1}'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
