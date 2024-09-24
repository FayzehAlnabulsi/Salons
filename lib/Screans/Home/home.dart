import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:salons/Widget/AppColor.dart';
import 'package:salons/Widget/AppSize.dart';
import 'package:salons/Widget/AppText.dart';
import '../../Widget/AppIcons.dart';
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
      body: Container(
        alignment: AlignmentDirectional.center,
        height: GeneralWidget.height(context),
        width: GeneralWidget.width(context),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 120.h,
              child: ListView.builder(
                itemCount: 5,
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 10.w),
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
                              backgroundColor: AppColor.mainColor,
                            ),
                            Visibility(
                                visible: index == 0,
                                child: CircleAvatar(
                                  radius: 12.r,
                                  backgroundColor: AppColor.white,
                                  child: Icon(AppIcons.addCircle, color: AppColor.lightGreenColor,),
                                ))
                          ],
                        ),
                        AppText(text: 'text', fontSize: AppSize.subTitle)
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
