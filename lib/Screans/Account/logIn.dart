import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salons/Screans/Account/porgot_password.dart';
import 'package:salons/Screans/Account/signUp.dart';
import 'package:salons/Screans/Home/main_screan.dart';
import 'package:salons/Widget/AppButtons.dart';
import 'package:salons/Widget/AppColor.dart';
import 'package:salons/Widget/AppDialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:salons/Widget/AppPath.dart';
import 'package:salons/Widget/AppRoutes.dart';
import 'package:salons/Widget/AppSize.dart';
import 'package:salons/Widget/AppSnackBar.dart';
import 'package:salons/Widget/AppText.dart';
import 'package:salons/Widget/AppTextFields.dart';
import 'package:salons/Widget/AppValidator.dart';
import 'package:salons/main.dart';
import '../../Widget/GeneralWidget.dart';

class Login extends StatefulWidget {
  static String route = '/login';
  bool? showSnackBar = false;
  Login({super.key, this.showSnackBar});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                    child: Form(
                      key: _key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5.r),
                            child: AppText(
                              text: AppLocalizations.of(context)!.logInAccount,
                              fontSize: AppSize.subTitle,
                              color: AppColor.textColor.withOpacity(0.7),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          AppTextFields(
                            validator: (v) =>
                                AppValidator.validatorEmail(context, v),
                            controller: email,
                            hintText: AppLocalizations.of(context)!.email,
                            fillColor: AppColor.backGroundColor,
                            borderColor: AppColor.subColor.withOpacity(0.6),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: AppTextFields(
                              validator: (v) =>
                                  AppValidator.validatorEmpty(context, v),
                              controller: password,
                              hintText: AppLocalizations.of(context)!.password,
                              obscureText: true,
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
                                          text: AppLocalizations.of(context)!
                                              .rememberMe,
                                          color: AppColor.textColor
                                              .withOpacity(0.7),
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
                                      text: AppLocalizations.of(context)!
                                          .forgotPassword,
                                      color:
                                          AppColor.textColor.withOpacity(0.7),
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
                              try {
                                _key.currentState!.validate()
                                    ? {
                                        AppDialog.showLoading(context: context),
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                                email: email.text,
                                                password: password.text)
                                            .then((user) {
                                          user != null
                                              ? AppRoutes.pushReplacementTo(
                                                  context, const MainScreen())
                                              : AppSnackBar.showInSnackBar(
                                                  context: context,
                                                  message:
                                                      'wrong email or password',
                                                  isSuccessful: false);
                                        }),
                                      }
                                    : null;
                              } on FirebaseAuthException catch (e) {
                                Navigator.pop(context);
                                if (e.code == 'user-not-found') {
                                  AppSnackBar.showInSnackBar(
                                      context: context,
                                      message: 'No user found for that email.',
                                      isSuccessful: false);
                                  debugPrint('No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  AppSnackBar.showInSnackBar(
                                      context: context,
                                      message:
                                          'Wrong password provided for that user.',
                                      isSuccessful: false);
                                  debugPrint(
                                      'Wrong password provided for that user.');
                                } else {
                                  _key.currentState!.validate()
                                      ? AppSnackBar.showInSnackBar(
                                          context: context,
                                          message: 'wrong email or password',
                                          isSuccessful: false)
                                      : null;
                                  debugPrint(e.toString());
                                }
                              }
                            },
                            text: AppLocalizations.of(context)!.logIn,
                            fontWeight: FontWeight.bold,
                            backgroundColor: AppColor.mainColor,
                          ),
                          SizedBox(height: 30.h),
                          RichText(
                              text: GeneralWidget.textSpan(children: [
                            TextSpan(
                                text: AppLocalizations.of(context)!
                                    .doNotHaveAccount,
                                style: TextStyle(
                                    color: AppColor.textColor.withOpacity(0.5),
                                    fontSize: AppSize.subTitle)),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                  //MyApp.setLocale(context, const Locale('ar'));
                                    AppRoutes.pushReplacementTo(
                                        context, SignUp());
                                  },
                                text: AppLocalizations.of(context)!.signUp,
                                style: TextStyle(
                                    color: AppColor.mainColor,
                                    fontSize: AppSize.subTitle)),
                          ]))
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
