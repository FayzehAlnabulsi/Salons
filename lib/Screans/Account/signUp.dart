import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salons/Screans/Account/logIn.dart';
import 'package:salons/Widget/AppButtons.dart';
import 'package:salons/Widget/AppColor.dart';
import 'package:salons/Widget/AppDialog.dart';
import 'package:salons/Widget/AppMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:salons/Widget/AppSize.dart';
import 'package:salons/Widget/AppSnackBar.dart';
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
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isUser = true;
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
                  color:
                      !isUser ? AppColor.mainColor : AppColor.backGroundColor,
                  margin: EdgeInsets.only(bottom: 0.h, top: 0.h),
                ),
                Container(
                  height: GeneralWidget.height(context) / 2,
                  width: GeneralWidget.width(context) / 2,
                  color: isUser ? AppColor.mainColor : AppColor.backGroundColor,
                  margin: EdgeInsets.only(bottom: 0.h, top: 0.h),
                ),
              ],
            ),
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: GeneralWidget.height(context) / 7,
                      width: GeneralWidget.width(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isUser = false;
                                });
                              },
                              child: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    color: !isUser
                                        ? AppColor.backGroundColor
                                        : AppColor.mainColor,
                                    borderRadius: BorderRadius.only(
                                        bottomRight:
                                            Radius.circular(isUser ? 50.r : 0),
                                        topRight: Radius.circular(
                                            !isUser ? 50.r : 0))),
                                child: Center(
                                  child: AppText(
                                    text: AppMessage.salons,
                                    fontSize: AppSize.secondaryTitle,
                                    color: !isUser
                                        ? AppColor.mainColor
                                        : AppColor.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isUser = true;
                                });
                              },
                              child: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    color: isUser
                                        ? AppColor.backGroundColor
                                        : AppColor.mainColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(isUser ? 50.r : 0),
                                        bottomLeft: Radius.circular(
                                            !isUser ? 50.r : 0))),
                                child: Center(
                                  child: AppText(
                                    text: AppMessage.user,
                                    fontSize: AppSize.secondaryTitle,
                                    color: isUser
                                        ? AppColor.mainColor
                                        : AppColor.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: GeneralWidget.height(context) / 1.17,
                  width: GeneralWidget.width(context),
                  color: AppColor.mainColor,
                  child: Container(
                    height: GeneralWidget.height(context) / 1.17,
                    width: GeneralWidget.width(context),
                    decoration: BoxDecoration(
                        color: AppColor.backGroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft:
                                !isUser ? Radius.zero : Radius.circular(40.r),
                            topRight:
                                !isUser ? Radius.circular(40.r) : Radius.zero)),
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
                                  controller: email,
                                  hintText: AppMessage.email,
                                  fillColor: AppColor.backGroundColor,
                                  borderColor:
                                      AppColor.subColor.withOpacity(0.6),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: AppTextFields(
                                  validator: (v) =>
                                      AppValidator.validatorPassword(v),
                                  controller: password,
                                  hintText: AppMessage.password,
                                  fillColor: AppColor.backGroundColor,
                                  obscureText: true,
                                  borderColor:
                                      AppColor.subColor.withOpacity(0.6),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: AppTextFields(
                                  validator: (v) =>
                                      AppValidator.validatorConfirmPassword(
                                          v, password.text),
                                  controller: TextEditingController(),
                                  hintText: AppMessage.confirmPass,
                                  obscureText: true,
                                  fillColor: AppColor.backGroundColor,
                                  borderColor:
                                      AppColor.subColor.withOpacity(0.6),
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              Builder(builder: (con) {
                                return AppButtons(
                                  onPressed: () async {
                                    try {
                                      AppDialog.showLoading(context: context);
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                        email: email.text,
                                        password: password.text,
                                      )
                                          .then((result) {
                                        Navigator.pop(context);
                                        AppSnackBar.showInSnackBar(
                                            context: con,
                                            message:
                                                'Account created successfully',
                                            isSuccessful: true);
                                        AppRoutes.pushReplacementTo(
                                            context, Login());
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      Navigator.pop(context);
                                      if (e.code == 'weak-password') {
                                        AppSnackBar.showInSnackBar(
                                            context: context,
                                            message:
                                                'The password provided is too weak.',
                                            isSuccessful: false);
                                        print(
                                            'The password provided is too weak.');
                                      } else if (e.code ==
                                          'email-already-in-use') {
                                        AppSnackBar.showInSnackBar(
                                            context: context,
                                            message:
                                                'The account already exists for that email.',
                                            isSuccessful: false);
                                        print(
                                            'The account already exists for that email.');
                                      }
                                    } catch (e) {
                                      AppSnackBar.showInSnackBar(
                                          context: context,
                                          message: '$e',
                                          isSuccessful: false);
                                      print(e);
                                    }
                                  },
                                  text: AppMessage.signUp,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: AppColor.mainColor,
                                );
                              }),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: RichText(
                                text: GeneralWidget.textSpan(children: [
                              TextSpan(
                                  text: AppMessage.youHaveAccount,
                                  style: TextStyle(
                                      color:
                                          AppColor.textColor.withOpacity(0.5),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
