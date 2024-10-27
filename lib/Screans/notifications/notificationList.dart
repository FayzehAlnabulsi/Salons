import 'package:flutter/material.dart';
import 'package:salons/Widget/AppBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Widget/AppColor.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({super.key});

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList>
    with TickerProviderStateMixin {
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
      body: Column(
        children: [],
      ),
    );
  }
}
