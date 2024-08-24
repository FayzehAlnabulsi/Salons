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
                    color: AppColor.lightSubColor,
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
                Container(
                  height: GeneralWidget.height(context) / 2,
                  width: GeneralWidget.width(context),
                  decoration: BoxDecoration(
                      color: AppColor.lightSubColor,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50.r))),
                  child: Center(
                    child: Image.asset(
                      'assets/images/smallLogo.png',
                      opacity: const AlwaysStoppedAnimation(.6),
                    ),
                  ),
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
                        AppText(
                          text: 'Login to your account',
                          fontSize: AppSize.labelSize,
                          color: AppColor.textColor.withOpacity(0.7),
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
                          padding: EdgeInsets.symmetric(vertical: 10.r),
                          child: AppTextFields(
                            validator: (v) => AppValidator.validatorEmpty(v),
                            controller: TextEditingController(),
                            hintText: 'password',
                            fillColor: AppColor.backGroundColor,
                            borderColor: AppColor.subColor.withOpacity(0.6),
                          ),
                        ),
                        GeneralWidget.checkBoxTile(value: false, onChange: (v){},title: AppText(text: 'remember me', fontSize: AppSize.labelSize)),
                        SizedBox(
                          height: 20.h,
                        ),
                        AppButtons(
                          onPressed: () {},
                          text: 'Login',
                          backgroundColor: AppColor.mainColor,
                        ),
                        SizedBox(height: 30.h),
                        RichText(
                            text: GeneralWidget.textSpan(children: [
                          TextSpan(
                              text: 'you dont have account?',
                              style: TextStyle(
                                  color: AppColor.textColor,
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
