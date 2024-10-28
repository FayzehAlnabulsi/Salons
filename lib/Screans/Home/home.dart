import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
              height: 110.h,
              child: ListView.builder(
                itemCount: 5,
                padding: EdgeInsets.only(
                    bottom: 5.h, top: 15.w, left: 10.w, right: 10.w),
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
                              radius: 35.r,
                              backgroundColor: AppColor.havanaPink,
                              child: CircleAvatar(
                                radius: 32.r,
                                backgroundColor: AppColor.backGroundColor,
                                child: CircleAvatar(
                                  radius: 29.r,
                                  backgroundColor: AppColor.secondaryColor,
                                ),
                              ),
                            ),
                            Visibility(
                                visible: index == 0,
                                child: CircleAvatar(
                                  radius: 10.r,
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
                        AppText(
                            text: 'salons',
                            fontSize: AppSize.subSecondaryTitleSize)
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 140.h,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Container(
                        height: 120.h,
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 80.w, bottom: 10.h),
                        decoration: BoxDecoration(
                          color: AppColor.havanaPink,
                          borderRadius: BorderRadius.circular(10.r),
                          // image: DecorationImage(
                          //   image: Image.network(
                          //           'https://www.shutterstock.com/image-photo/beauty-background-facial-cosmetic-products-260nw-1698488116.jpg')
                          //       .image,
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        child: SizedBox(
                          width: 230.w,
                          child: AppText(
                            text:
                                'Beauty begins when you decide to be yourself',
                            fontSize: AppSize.secondaryTitle,
                            color: AppColor.white,
                            align: TextAlign.center,
                            fontFamily:
                                GoogleFonts.playfairDisplay().fontFamily,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: SmoothPageIndicator(
                          controller: PageController(), // PageController
                          count: 1,
                          effect: WormEffect(
                              dotColor: AppColor.textColor,
                              dotHeight: 8.h,
                              dotWidth: 8.w,
                              activeDotColor:
                                  AppColor.beige), // your preferred effect
                          onDotClicked: (index) {}),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Transform.translate(
                        offset: Offset(15.w, -0.h),
                        child: Image.asset('assets/images/sliderimage0.png')),
                  ),
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
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                children: List.generate(
                  50,
                  (index) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: index % 3 == 0
                                ? Image.network(
                                    'https://m.maccosmetics.co.th/media/export/cms/makeup_services/assets_2019/aptBookingLanding_806x625_v1.jpg',
                                  ).image
                                : index % 2 == 0
                                    ? Image.network(
                                            'https://images.squarespace-cdn.com/content/v1/532aa86ae4b025b2a07ff10f/1541520174293-O4N3KOTR2JNVCCBAL2M6/Twisted-half-up-hairstyle-2018-long-wedding-hair-trends.jpg')
                                        .image
                                    : Image.network(
                                            'https://sublimelife.in/cdn/shop/articles/Artboard_17.jpg?v=1684151976')
                                        .image,
                            fit: BoxFit.cover,
                            opacity: 0.7),
                        color: AppColor.lightGreenColor,
                        // Color((Random().nextDouble() * 0xFFFFFF).toInt())
                        //     .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10.r)),
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.all(10.r),
                    height: (150 + (index % 3 == 0 ? 250 : 150)).toDouble(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      AppText(
                        text: 'Salon name',
                        fontSize: AppSize.subSecondaryTitleSize,
                        color: AppColor.white,
                      ),
                      AppText(
                        text: 'Advertising text text',
                        fontSize: AppSize.subTitle,
                        color: AppColor.white,
                      ),
                    ],)
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
