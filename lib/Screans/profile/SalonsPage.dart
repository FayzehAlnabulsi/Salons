import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masonry_list_view_grid/masonry_list_view_grid.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:salons/Widget/AppButtons.dart';
import 'package:salons/Widget/AppColor.dart';
import 'package:salons/Widget/AppIcons.dart';
import 'package:salons/Widget/AppText.dart';
import '../../Widget/AppSize.dart';
import '../../Widget/GeneralWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SalonsPage extends StatefulWidget {
  const SalonsPage({super.key});

  @override
  State<SalonsPage> createState() => _SalonsPageState();
}

class _SalonsPageState extends State<SalonsPage> {
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
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 350.h,
                decoration: BoxDecoration(
                    color: AppColor.lightGreenColor,
                    image: DecorationImage(
                        image: Image.network(
                          'https://static.vecteezy.com/system/resources/thumbnails/021/966/428/small_2x/beauty-logo-for-woman-logo-can-be-used-for-beauty-salon-cosmetic-spa-premium-vector.jpg',
                        ).image,
                        opacity: 0.8,
                        fit: BoxFit.cover)),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: IconButton(
                    icon: Icon(
                      AppIcons.back,
                      color: AppColor.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 530.spMin,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.backGroundColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    AppText(
                      text: 'Salon Name',
                      fontSize: AppSize.secondaryTitle - 1,
                      color: AppColor.textColor.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                      textHeight: 2,
                    ),
                    SizedBox(
                      width: 300.w,
                      child: AppText(
                        text:
                            'salon description salon description salon description salon description',
                        fontSize: AppSize.subSecondaryTitleSize,
                        color: AppColor.textColor.withOpacity(0.7),
                        align: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButtons(
                          onPressed: () {},
                          text: 'Follow',
                          backgroundColor: AppColor.havanaPink,
                          width: 150.w,
                          height: 35.h,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          width: 150.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColor.backGroundColor,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: AppColor.havanaPink, width: 0.7)),
                          child: Center(
                              child: AppText(
                            text: 'Message',
                            fontSize: AppSize.buttonsFontSize,
                            color: AppColor.havanaPink,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //
                    //         SizedBox(
                    //           height: 3.h,
                    //         ),
                    //         AppText(
                    //           text: 'orders',
                    //           fontSize: AppSize.subSecondaryTitleSize - 2,
                    //           color: AppColor.textColor,
                    //         ),
                    //         SizedBox(
                    //           height: 3.h,
                    //         ),
                    //         AppText(
                    //           text: '300K',
                    //           fontSize: AppSize.subSecondaryTitleSize - 2,
                    //           color: AppColor.textColor.withOpacity(0.7),
                    //         )
                    //       ],
                    //     ),
                    //     SizedBox(
                    //       height: 50.h,
                    //       child: VerticalDivider(
                    //         color: AppColor.textColor.withOpacity(0.3),
                    //         thickness: 0.5,
                    //         width: 100.w,
                    //       ),
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         SizedBox(
                    //           height: 5.h,
                    //         ),
                    //         AppText(
                    //           text: 'Followers',
                    //           fontSize: AppSize.subSecondaryTitleSize - 2,
                    //           color: AppColor.textColor,
                    //         ),
                    //         SizedBox(
                    //           height: 3.h,
                    //         ),
                    //         AppText(
                    //           text: '2M',
                    //           fontSize: AppSize.subSecondaryTitleSize - 2,
                    //           color: AppColor.textColor.withOpacity(0.7),
                    //         )
                    //       ],
                    //     ),
                    //
                    //   ],
                    // ),
                    Flexible(
                      child: SizedBox(
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
                                height: (150 + (index % 3 == 0 ? 150 : 100))
                                    .toDouble(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      text: 'Advertising text text',
                                      fontSize: AppSize.subTitle,
                                      color: AppColor.white,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
