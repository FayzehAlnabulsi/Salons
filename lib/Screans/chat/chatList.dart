import 'package:flutter/material.dart';
import 'package:salons/Widget/AppBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Widget/AppColor.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: '',
        //AppLocalizations.of(context)!.chat,
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
