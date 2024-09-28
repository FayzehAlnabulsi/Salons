import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salons/Screans/Account/logIn.dart';
import 'package:salons/Widget/AppButtons.dart';
import 'package:salons/Widget/AppColor.dart';
import 'package:salons/Widget/AppDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:salons/Widget/AppSize.dart';
import 'package:salons/Widget/AppSnackBar.dart';
import 'package:salons/Widget/AppText.dart';
import 'package:salons/Widget/AppTextFields.dart';
import 'package:salons/Widget/AppValidator.dart';
import 'package:salons/main.dart';
import '../../Widget/AppRoutes.dart';
import '../../Widget/GeneralWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _key = GlobalKey();
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
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
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
            ),
            Column(
              children: [
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Stack(
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
                                          topRight: MyApp.getLocale(context)
                                                      ?.countryCode ==
                                                  'ar'
                                              ? Radius.circular(
                                                  !isUser ? 0.r : 50.r)
                                              : Radius.circular(
                                                  !isUser ? 50.r : 0))),
                                  child: Center(
                                    child: AppText(
                                      text: AppLocalizations.of(context)!.salon,
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
                                      text: AppLocalizations.of(context)!.user,
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
                ),
                Container(
                  height: GeneralWidget.height(context) / 1.167,
                  width: GeneralWidget.width(context),
                  color: AppColor.mainColor,
                  child: Container(
                    height: GeneralWidget.height(context) / 1.167,
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
                          Form(
                            key: _key,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 5.r, top: 70.h),
                                  child: AppText(
                                    text: AppLocalizations.of(context)!
                                        .createAccount,
                                    fontSize: AppSize.secondaryTitle,
                                    color: AppColor.textColor.withOpacity(0.7),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                AppTextFields(
                                  validator: (v) =>
                                      AppValidator.validatorUserName(
                                          context, v),
                                  controller: TextEditingController(),
                                  hintText:
                                      AppLocalizations.of(context)!.userName,
                                  fillColor: AppColor.backGroundColor,
                                  borderColor:
                                      AppColor.subColor.withOpacity(0.6),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: AppTextFields(
                                    validator: (v) =>
                                        AppValidator.validatorEmail(context, v),
                                    controller: email,
                                    hintText:
                                        AppLocalizations.of(context)!.email,
                                    fillColor: AppColor.backGroundColor,
                                    borderColor:
                                        AppColor.subColor.withOpacity(0.6),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: AppTextFields(
                                    validator: (v) =>
                                        AppValidator.validatorPassword(
                                            context, v),
                                    controller: password,
                                    hintText:
                                        AppLocalizations.of(context)!.password,
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
                                            context, v, password.text),
                                    controller: TextEditingController(),
                                    hintText: AppLocalizations.of(context)!
                                        .confirmPass,
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
                                        _key.currentState!.validate()
                                            ? {
                                                AppDialog.showLoading(
                                                    context: context),
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
                                                }),
                                              }
                                            : null;
                                      } on FirebaseAuthException catch (e) {
                                        Navigator.pop(context);
                                        if (e.code == 'weak-password') {
                                          AppSnackBar.showInSnackBar(
                                              context: context,
                                              message:
                                                  'The password provided is too weak.',
                                              isSuccessful: false);
                                          debugPrint(
                                              'The password provided is too weak.');
                                        } else if (e.code ==
                                            'email-already-in-use') {
                                          AppSnackBar.showInSnackBar(
                                              context: context,
                                              message:
                                                  'The account already exists for that email.',
                                              isSuccessful: false);
                                          debugPrint(
                                              'The account already exists for that email.');
                                        }
                                      } catch (e) {
                                        _key.currentState!.validate()
                                            ? AppSnackBar.showInSnackBar(
                                                context: context,
                                                message: '$e',
                                                isSuccessful: false)
                                            : null;
                                        debugPrint(e.toString());
                                      }
                                    },
                                    text: AppLocalizations.of(context)!.signUp,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: AppColor.mainColor,
                                  );
                                }),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: RichText(
                                text: GeneralWidget.textSpan(children: [
                              TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .youHaveAccount,
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
                                  text:
                                      '  ${AppLocalizations.of(context)!.logIn}',
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
