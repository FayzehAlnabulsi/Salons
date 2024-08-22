import 'package:flutter/material.dart';

import 'AppColor.dart';

class AppRefreshIndicator extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget child;
  const AppRefreshIndicator(
      {Key? key, required this.onRefresh, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColor.white,
      backgroundColor: AppColor.mainColor,
      child: child,
    );
  }
}
