import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salons/Widget/AppSize.dart';
import 'package:salons/Widget/AppText.dart';
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
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:25.h, horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/smallLogo.png',
                    height: 100.h,
                    width: 150.w,
                  )),
              AppText(
                text: '',
                fontSize: AppSize.headSize + 10,
                fontFamily: GoogleFonts.qwitcherGrypen().fontFamily,
              )
            ],
          ),
        ),
      ),
    );
  }
}
