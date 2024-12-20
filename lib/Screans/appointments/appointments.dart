import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import '../../Widget/AppBar.dart';
import '../../Widget/AppColor.dart';
import '../../Widget/GeneralWidget.dart';
import '../../Widget/AppMotionNavBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: '',
        //AppLocalizations.of(context)!.notification,
        elevation: 1,
        backgroundColor: AppColor.backGroundColor,
        textColor: AppColor.mainColor,
        actions: [],
      ),
      body: Container(
        alignment: AlignmentDirectional.center,
        height: GeneralWidget.height(context),
        width: GeneralWidget.width(context),
      ),
    );
  }
}
