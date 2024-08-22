import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'AppColor.dart';
import 'AppSize.dart';
import 'AppText.dart';

class AppRadio extends StatelessWidget {
  final String labelName;
  final int? groupValue;
  final int value;
  final Color? textColor;
  final void Function(int?)? onChanged;
  const AppRadio(
      {Key? key,
      required this.labelName,
      required this.groupValue,
      required this.value,
      this.onChanged,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(10.w, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              fillColor: MaterialStateColor.resolveWith(
                  (states) => states.contains(MaterialState.selected)
                      ? AppColor.mainColor // Active Color
                      : AppColor.grey.withOpacity(0.6) // Inactive Color
                  ),
              value: value,
              groupValue: groupValue,
              onChanged: onChanged),
          AppText(
            text: labelName,
            color: textColor ?? AppColor.textColor,
            fontSize: AppSize.subTitle,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
