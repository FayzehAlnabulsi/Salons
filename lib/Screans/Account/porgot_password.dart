import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:salons/Widget/AppBar.dart';
import 'package:salons/Widget/AppButtons.dart';
import 'package:salons/Widget/AppMessage.dart';
import 'package:salons/Widget/AppPath.dart';
import 'package:salons/Widget/AppText.dart';
import 'package:salons/Widget/AppTextFields.dart';
import 'package:salons/Widget/AppValidator.dart';
import '../../Widget/GeneralWidget.dart';

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
      appBar: const AppBarWidget(
        text: AppMessage.resetPass,
      ),
      body: Container(
        alignment: AlignmentDirectional.center,
        height: GeneralWidget.height(context),
        width: GeneralWidget.width(context),
        child: Form(
          key: _key,
          child: Padding(
            padding: EdgeInsets.all(15.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(AppPath.resetPassword,
                    fit: BoxFit.cover, alignment: Alignment.topCenter),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.h, top: 50.h),
                  child: AppTextFields(
                      validator: (email) => AppValidator.validatorEmail(email),
                      controller: email,
                      hintText: AppMessage.email),
                ),
                AppButtons(
                    onPressed: () {
                      _key.currentState!.validate() ? {} : null;
                    },
                    text: AppMessage.send)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
