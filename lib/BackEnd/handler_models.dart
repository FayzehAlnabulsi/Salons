import 'dart:math';
import 'package:flutter/material.dart';

class DataHandle<T> {
  T? data;
  String result;
  String? type;
  bool? reCallData;
  DataHandle({this.data, required this.result, this.type, this.reCallData});
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
