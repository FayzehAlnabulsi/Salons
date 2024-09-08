import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salons/Screans/Account/porgot_password.dart';
import 'package:salons/Screans/Account/signUp.dart';
import 'package:salons/Widget/AppButtons.dart';
import 'package:salons/Widget/AppColor.dart';
import 'package:salons/Widget/AppDialog.dart';
import 'package:salons/Widget/AppMessage.dart';
import 'package:salons/Widget/AppPath.dart';
import 'package:salons/Widget/AppRoutes.dart';
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
  bool rememberMe = false;

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
                ),
                Container(
                  height: GeneralWidget.height(context) / 2,
                  width: GeneralWidget.width(context) / 2,
                  color: AppColor.backGroundColor.withOpacity(0.6),
                ),
              ],
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
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColor.beige, blurRadius: 150.r)
                                ],
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
                        AppPath.smallLogo,
                        height: 200.h,
                        width: 300.w,
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
                            text: AppMessage.logInAccount,
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
                          hintText: AppMessage.userName,
                          fillColor: AppColor.backGroundColor,
                          borderColor: AppColor.subColor.withOpacity(0.6),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: AppTextFields(
                            validator: (v) => AppValidator.validatorEmpty(v),
                            controller: TextEditingController(),
                            hintText: AppMessage.password,
                            fillColor: AppColor.backGroundColor,
                            borderColor: AppColor.subColor.withOpacity(0.6),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h, left: 5.spMin),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  child: InkWell(
                                onTap: () {
                                  setState(() {
                                    rememberMe = !rememberMe;
                                  });
                                },
                                child: GeneralWidget.checkBoxTile(
                                    value: rememberMe,
                                    title: AppText(
                                        text: AppMessage.rememberMe,
                                        color:
                                            AppColor.textColor.withOpacity(0.7),
                                        fontSize: AppSize.smallTextSize),
                                    contentPadding: EdgeInsets.zero),
                              )),
                              Flexible(
                                  child: InkWell(
                                onTap: () {
                                  AppRoutes.pushTo(
                                      context, const ForgotPassword());
                                },
                                child: AppText(
                                    text: AppMessage.forgotPassword,
                                    color: AppColor.textColor.withOpacity(0.7),
                                    fontSize: AppSize.smallTextSize),
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        AppButtons(
                          onPressed: () async {
                            AppDialog.showLoading(context: context);
                            await Future.delayed(const Duration(seconds: 2));
                            Navigator.pop(context);
                          },
                          text: AppMessage.logIn,
                          fontWeight: FontWeight.bold,
                          backgroundColor: AppColor.mainColor,
                        ),
                        SizedBox(height: 30.h),
                        RichText(
                            text: GeneralWidget.textSpan(children: [
                          TextSpan(
                              text: AppMessage.doNotHaveAccount,
                              style: TextStyle(
                                  color: AppColor.textColor.withOpacity(0.5),
                                  fontSize: AppSize.subTitle)),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  AppRoutes.pushReplacementTo(
                                      context, SignUp());
                                },
                              text: AppMessage.signUp,
                              style: TextStyle(
                                  color: AppColor.mainColor,
                                  fontSize: AppSize.subTitle)),
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
