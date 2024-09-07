import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salons/Screans/Account/logIn.dart';
import 'package:salons/Widget/AppButtons.dart';
import 'package:salons/Widget/AppColor.dart';
import 'package:salons/Widget/AppMessage.dart';
import 'package:salons/Widget/AppPath.dart';
import 'package:salons/Widget/AppSize.dart';
import 'package:salons/Widget/AppText.dart';
import 'package:salons/Widget/AppTextFields.dart';
import 'package:salons/Widget/AppValidator.dart';
import '../../Widget/AppRoutes.dart';
import '../../Widget/GeneralWidget.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isSalon = true;
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: GeneralWidget.height(context) / 2,
                  width: GeneralWidget.width(context) / 2,
                  color: AppColor.mainColor,
                  margin: EdgeInsets.only(bottom: 30.h, top: 70.h),
                ),
                Container(
                  height: GeneralWidget.height(context) / 2,
                  width: GeneralWidget.width(context) / 2,
                  color: AppColor.mainColor,
                  margin: EdgeInsets.only(bottom: 30.h, top: 70.h),
                ),
              ],
            ),
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: GeneralWidget.height(context) / 7,
                      width: GeneralWidget.width(context),
                      decoration: BoxDecoration(
                        color: AppColor.mainColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isSalon = false;
                                });
                              },
                              child: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    color: !isSalon
                                        ? AppColor.backGroundColor
                                        : null,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(
                                            isSalon ? 50.r : 0))),
                                padding: EdgeInsets.only(
                                    top: 10.h, left: 65.w, right: 65.w),
                                child: Center(
                                  child: AppText(
                                    text: AppMessage.salons,
                                    fontSize: AppSize.secondaryTitle,
                                    color: !isSalon
                                        ? AppColor.mainColor
                                        : AppColor.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isSalon = true;
                                });
                              },
                              child: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    color: isSalon
                                        ? AppColor.backGroundColor
                                        : null,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(
                                            !isSalon ? 50.r : 0))),
                                padding: EdgeInsets.only(
                                    top: 10.h, left: 65.w, right: 65.w),
                                child: Center(
                                  child: AppText(
                                    text: AppMessage.user,
                                    fontSize: AppSize.secondaryTitle,
                                    color: isSalon
                                        ? AppColor.mainColor
                                        : AppColor.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: GeneralWidget.height(context) / 1.17,
                  width: GeneralWidget.width(context),
                  decoration: BoxDecoration(
                      color: AppColor.backGroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft:
                              !isSalon ? Radius.zero : Radius.circular(40.r),
                          topRight:
                              !isSalon ? Radius.circular(40.r) : Radius.zero)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.r, top: 70.h),
                              child: AppText(
                                text: AppMessage.createAccount,
                                fontSize: AppSize.secondaryTitle,
                                color: AppColor.textColor.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            AppTextFields(
                              validator: (v) =>
                                  AppValidator.validatorUserName(v),
                              controller: TextEditingController(),
                              hintText: AppMessage.userName,
                              fillColor: AppColor.backGroundColor,
                              borderColor: AppColor.subColor.withOpacity(0.6),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: AppTextFields(
                                validator: (v) =>
                                    AppValidator.validatorEmail(v),
                                controller: TextEditingController(),
                                hintText: AppMessage.email,
                                fillColor: AppColor.backGroundColor,
                                borderColor: AppColor.subColor.withOpacity(0.6),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: AppTextFields(
                                validator: (v) =>
                                    AppValidator.validatorEmpty(v),
                                controller: TextEditingController(),
                                hintText: AppMessage.password,
                                fillColor: AppColor.backGroundColor,
                                borderColor: AppColor.subColor.withOpacity(0.6),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: AppTextFields(
                                validator: (v) =>
                                    AppValidator.validatorEmpty(v),
                                controller: TextEditingController(),
                                hintText: AppMessage.confirmPass,
                                fillColor: AppColor.backGroundColor,
                                borderColor: AppColor.subColor.withOpacity(0.6),
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            AppButtons(
                              onPressed: () {},
                              text: AppMessage.signUp,
                              fontWeight: FontWeight.bold,
                              backgroundColor: AppColor.mainColor,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: RichText(
                              text: GeneralWidget.textSpan(children: [
                            TextSpan(
                                text: AppMessage.youHaveAccount,
                                style: TextStyle(
                                    color: AppColor.textColor.withOpacity(0.5),
                                    fontSize: AppSize.subTitle)),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    AppRoutes.pushReplacementTo(
                                        context, Login());
                                  },
                                text: '  ${AppMessage.logIn}',
                                style: TextStyle(
                                    color: AppColor.mainColor,
                                    fontSize: AppSize.subTitle)),
                          ])),
                        )
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
