import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'AppMessage.dart';
import 'AppSize.dart';
import 'AppPath.dart';
import 'AppText.dart';

class HandleException extends StatefulWidget {
  final message;
  final Widget? child;

  const HandleException({super.key, this.message, this.child});

  @override
  State<HandleException> createState() => _HandleExceptionState();

  static getMessage(message, {bool showScaffold = false}) {
    if (message == AppMessage.serverExceptions) {
      return AppMessage.serverText;
    } else if (message == AppMessage.socketException) {
      return AppMessage.socketText;
    } else if (message == AppMessage.timeoutException) {
      return AppMessage.timeoutText;
    } else if (message == AppMessage.formatException) {
      return AppMessage.formatText;
    } else if (message == AppMessage.unAuthorized) {
      return AppMessage.unAuthorizedText;
    }
    return message;
  }

  static handelListContainers({child, message}) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 70.h,
                    child: AspectRatio(
                      aspectRatio: 10 / 2,
                      child: SvgPicture.asset(AppPath.apiError),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        AppText(
                          text: HandleException.getMessage(message),
                          fontSize: AppSize.smallTextSize,
                          align: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        child
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HandleExceptionState extends State<HandleException> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 3 / 2,
                child: SvgPicture.asset(AppPath.apiError),
              ),
              SizedBox(
                height: 20.h,
              ),
              AppText(
                text: HandleException.getMessage(widget.message),
                fontSize: AppSize.subTitle,
                align: TextAlign.center,
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.w),
                child: widget.child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
