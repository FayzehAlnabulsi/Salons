import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppText.dart';

class AppRoutes {
//pushTo========================================================================
  static void pushTo(BuildContext context, pageName,
      {bool? noAnimation,
      Duration transitionDuration = const Duration(milliseconds: 300)}) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => pageName));
  }

//pushReplacement========================================================================
  static void pushReplacementTo(BuildContext context, pageName,
      {bool? noAnimation}) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => pageName));
  }

//push And Remove All Page ========================================================================
  static pushAndRemoveAllPageTo(BuildContext context, page,
      {bool? noAnimation, required bool removeProviderData}) {
    if (removeProviderData == true) {
      // context.read<ProviderClass>().emptyProviderData();
      // color_print('empty Provider Data done');
    }
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (_) => page), (route) => false);
  }

  //push and refresh ===================================================================================
  static pushThenRefresh(context, pageName, {then}) {
    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => pageName,
        )).then(then);
  }
}
