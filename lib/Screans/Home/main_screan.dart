import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import '../../Widget/GeneralWidget.dart';
import '../../Widget/AppMotionNavBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: AppMotionNavBar(
        motionTabBarController: _motionTabBarController,
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController!.index = value;
          });
        },
      ),
      body: Container(
        alignment: AlignmentDirectional.center,
        height: GeneralWidget.height(context),
        width: GeneralWidget.width(context),
        child: TabBarView(
          physics:
              const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
          // controller: _tabController,
          controller: _motionTabBarController,
          children: <Widget>[
            Center(
              child: Text(AppLocalizations.of(context)!.appointments),
            ),
            Center(
              child: Text(AppLocalizations.of(context)!.home),
            ),
            Center(
              child: Text(AppLocalizations.of(context)!.profile),
            ),
          ],
        ),
      ),
    );
  }
}
