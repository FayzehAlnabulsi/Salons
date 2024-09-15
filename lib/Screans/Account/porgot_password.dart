import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:salons/Widget/AppBar.dart';
import 'package:salons/Widget/AppButtons.dart';
import 'package:salons/Widget/AppColor.dart';
import 'package:salons/Widget/AppPath.dart';
import 'package:salons/Widget/AppSize.dart';
import 'package:salons/Widget/AppText.dart';
import 'package:salons/Widget/AppTextFields.dart';
import 'package:salons/Widget/AppValidator.dart';
import '../../Widget/GeneralWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarWidget(
        text: AppLocalizations.of(context)!.resetPass,
      ),
      body: Container(
        alignment: AlignmentDirectional.center,
        height: GeneralWidget.height(context),
        width: GeneralWidget.width(context),
        child: Form(
          key: _key,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(AppPath.resetPassword,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    height: 150.h,
                    width: 150.w),
                Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: AppText(
                    text:
                        AppLocalizations.of(context)!.resetPasswordDescription,
                    fontSize: AppSize.labelSize,
                    color: AppColor.textColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.h, top: 20.h),
                  child: AppTextFields(
                      validator: (email) =>
                          AppValidator.validatorEmail(context, email),
                      controller: email,
                      hintText: AppLocalizations.of(context)!.email),
                ),
                AppButtons(
                    onPressed: () {
                      _key.currentState!.validate() ? {} : null;
                    },
                    text: AppLocalizations.of(context)!.send)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
