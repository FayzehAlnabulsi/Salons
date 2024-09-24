import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import '../../Widget/GeneralWidget.dart';
import '../../Widget/AppMotionNavBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
      body: Container(
        alignment: AlignmentDirectional.center,
        height: GeneralWidget.height(context),
        width: GeneralWidget.width(context),
      ),
    );
  }
}
