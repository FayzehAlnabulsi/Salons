import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:salons/Widget/AppBar.dart';
import 'package:salons/Widget/AppMessage.dart';
import 'package:salons/Widget/AppPath.dart';
import 'package:salons/Widget/AppText.dart';
import '../../Widget/GeneralWidget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
        child: Lottie.asset(AppPath.resetPassword,
            fit: BoxFit.cover, alignment: Alignment.topCenter),
      ),
    );
  }
}
