import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salons/Widget/AppButtons.dart';
import 'package:salons/Widget/AppColor.dart';
import 'package:salons/Widget/AppSize.dart';
import 'package:salons/Widget/AppText.dart';
import 'package:salons/Widget/AppTextFields.dart';
import 'package:salons/Widget/AppValidator.dart';
import '../../Widget/GeneralWidget.dart';

class Login extends StatefulWidget {
  static String route = '/login';
  bool? showSnackBar = false;
  Login({super.key, this.showSnackBar});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: AlignmentDirectional.center,
        height: GeneralWidget.height(context),
        width: GeneralWidget.width(context),
        child: Stack(
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: GeneralWidget.height(context) / 2,
                    width: GeneralWidget.width(context) / 2,
                    color: AppColor.mainColor,
                  ),
                  Container(
                    height: GeneralWidget.height(context) / 2,
                    width: GeneralWidget.width(context) / 2,
                    color: AppColor.backGroundColor.withOpacity(0.6),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: GeneralWidget.height(context) / 2,
                      width: GeneralWidget.width(context),
                      decoration: BoxDecoration(
                          color: AppColor.mainColor,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50.r))),
                      child: UnconstrainedBox(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                          child: Container(
                            margin: EdgeInsets.only(top: 30.h),
                            height: 180.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                                color: AppColor.lightSubColor.withOpacity(0.05),
                                boxShadow: [BoxShadow(color: AppColor.beige,blurRadius: 150.r)],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(150.r),
                                    topRight: Radius.circular(100.r),
                                    bottomRight: Radius.circular(125.r),
                                    bottomLeft: Radius.circular(100.r))),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: Image.asset(
                        'assets/images/smallLogo.png',
                        height: 200.h,
                        width: 300.w,
                        // opacity: const AlwaysStoppedAnimation(.6),
                      ),
                    )
                  ],
                ),
                Container(
                  height: GeneralWidget.height(context) / 2,
                  width: GeneralWidget.width(context),
                  decoration: BoxDecoration(
                      color: AppColor.backGroundColor,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50.r))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.r),
                          child: AppText(
                            text: 'Login to your account',
                            fontSize: AppSize.subTitle,
                            color: AppColor.textColor.withOpacity(0.7),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        AppTextFields(
                          validator: (v) => AppValidator.validatorUserName(v),
                          controller: TextEditingController(),
                          hintText: 'userName',
                          fillColor: AppColor.backGroundColor,
                          borderColor: AppColor.subColor.withOpacity(0.6),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: AppTextFields(
                            validator: (v) => AppValidator.validatorEmpty(v),
                            controller: TextEditingController(),
                            hintText: 'password',
                            fillColor: AppColor.backGroundColor,
                            borderColor: AppColor.subColor.withOpacity(0.6),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                child: Transform.translate(
                              offset: Offset(-8.w, -8.h),
                              child: GeneralWidget.checkBoxTile(
                                  value: false,
                                  onChange: (v) {},
                                  title: Transform.translate(
                                    offset: Offset(-18.w, 0),
                                    child: AppText(
                                        text: 'remember me',
                                        color:
                                            AppColor.textColor.withOpacity(0.7),
                                        fontSize: AppSize.textFieldsHintSize),
                                  ),
                                  contentPadding: EdgeInsets.zero),
                            )),
                            Flexible(
                                child: Transform.translate(
                              offset: Offset(-8.w, -8.h),
                              child: AppText(
                                  text: 'forgot password?',
                                  color: AppColor.textColor.withOpacity(0.7),
                                  fontSize: AppSize.textFieldsHintSize),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        AppButtons(
                          onPressed: () {},
                          text: 'Login',
                          fontWeight: FontWeight.bold,
                          backgroundColor: AppColor.mainColor,
                        ),
                        SizedBox(height: 30.h),
                        RichText(
                            text: GeneralWidget.textSpan(children: [
                          TextSpan(
                              text: 'you dont have account?',
                              style: TextStyle(
                                  color: AppColor.textColor.withOpacity(0.5),
                                  fontSize: AppSize.smallTextSize)),
                          TextSpan(
                              text: '  Sign Up',
                              style: TextStyle(
                                  color: AppColor.mainColor,
                                  fontSize: AppSize.smallTextSize)),
                        ]))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
