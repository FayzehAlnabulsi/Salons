import 'package:flutter/material.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            AppText(
              text: 'was born ready',
              fontSize: AppSize.headSize + 10,
              fontFamily: GoogleFonts.qwitcherGrypen().fontFamily,
            )
          ],
        ),
      ),
    );
  }
}
