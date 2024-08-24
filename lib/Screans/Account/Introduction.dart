import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:salons/Screans/Account/logIn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Widget/AppColor.dart';
import '../../Widget/AppMessage.dart';
import '../../Widget/AppRoutes.dart';
import '../../Widget/AppSize.dart';
import '../../Widget/AppText.dart';
import '../../Widget/GeneralWidget.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen>
    with AutomaticKeepAliveClientMixin<IntroductionScreen> {
  late List<LottieBuilder> images;
  late List<String> title;
  late List<String> subtitle;

  final PageController pageController = PageController();
  int selectedIndex = 0;
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.toInt();
      });
    });
    images = [
      Lottie.asset('assets/lottie/intro1.json', height: 350.h, width: 350.w),
  //    Lottie.asset('assets/lottie/intro2.json', height: 350.h, width: 350.w),
      Lottie.asset('assets/lottie/intro3.json', height: 350.h, width: 350.w),
    ];
    title = ['Self Care',
      //'All you need',
      'One Click'];
    subtitle = [
      'Take time for yourself and relax, all you need in one place',
      //'All your self care needs in one place',
      'book your appointment easy and fast'
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColor.beige,
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: PageView.builder(
                itemCount: images.length,
                controller: pageController,
                allowImplicitScrolling: true,
                itemBuilder: (con, index) {
                  return Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
//color container==========================================================================================================================================================
                      Container(
                          height: GeneralWidget.height(context),
                          width: GeneralWidget.width(context),
                          decoration: BoxDecoration(color: AppColor.beige)),
//arc container==========================================================================================================================================================
                      ClipPath(
                        clipper: SimpleCurveClipper(),
                        child: Container(
                          alignment: AlignmentDirectional.bottomCenter,
                          height: GeneralWidget.height(context) * 0.34,
                          width: GeneralWidget.width(context),
                          color: AppColor.subColor,
                        ),
                      ),
//image container==========================================================================================================================================================
                      Positioned(
                          top: index == 1 ? 250.h : 80.h,
                          child: images[index]),

//title text==========================================================================================================================================================
                      Positioned(
                        top: index == 1 ? 150.h : 440.h,
                        child: AppText(
                          text: title[index],
                          fontSize: AppSize.headSize - 5,
                          color: AppColor.textColor,
                          fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                          align: TextAlign.center,
                        ),
                      ),
// //subTitle text==========================================================================================================================================================
                      Positioned(
                        top: index == 1 ? 190.h : 480.h,
                        left: 20.w,
                        right: 20.w,
                        child: AppText(
                          text: subtitle[index],
                          fontSize: AppSize.titleSize,
                          color: AppColor.textColor.withOpacity(0.8),
                          align: TextAlign.center,
                          fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                        ),
                      ),
// //dot indicator==========================================================================================================================================================
                    ],
                  );
                },
              ),
            ),
//===========================================================================================================
            Container(
              height: 60.h,
              //color: amber,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(),

                  ///Dots
                  SmoothPageIndicator(
                    controller: pageController,
                    count: images.length,
                    onDotClicked: (index) {
                      pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn);
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    effect: JumpingDotEffect(
                        spacing: 15.0,
                        radius: 25.0.r,
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                        dotColor: Colors.grey,
                        // verticalOffset: 15,
                        activeDotColor: AppColor.mainColor),
                  ),

                  ///Start
                  GestureDetector(
                      onTap: () async {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        await preferences.setInt('initScreen', 1);
                        AppRoutes.pushReplacementTo(context, Login());
                      },
                      child: Visibility(
                        visible:
                            currentIndex < images.length - 1 ? false : true,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: AppText(
                            text: AppMessage.logIn,
                            fontSize: AppSize.labelSize,
                            color: AppColor.textColor,
                            align: TextAlign.center,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                          ),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class SimpleCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, 40);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
