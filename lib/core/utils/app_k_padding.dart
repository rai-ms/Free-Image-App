import 'package:flutter/material.dart';

/// --------------- [AppPadding] Use to add padding as well as margin ---------------------------- //
abstract class AppPadding {
  static const EdgeInsets z = EdgeInsets.zero;
  static const EdgeInsets padA2 = EdgeInsets.all(2);
  static const EdgeInsets padA4 = EdgeInsets.all(4);
  static const EdgeInsets padL5 = EdgeInsets.only(left: 5);
  static const EdgeInsets padL8 = EdgeInsets.only(left: 8);
  static const EdgeInsets padL10 = EdgeInsets.only(left: 10);
  static const EdgeInsets padR5 = EdgeInsets.only(right: 5);
  static const EdgeInsets padR8 = EdgeInsets.only(right: 8);
  static const EdgeInsets padR10 = EdgeInsets.only(right: 10);
  static const EdgeInsets padA5 = EdgeInsets.all(5);
  static const EdgeInsets padA8 = EdgeInsets.all(8);
  static const EdgeInsets padA10 = EdgeInsets.all(10);
  static const EdgeInsets padA12 = EdgeInsets.all(12);
  static const EdgeInsets padA13 = EdgeInsets.all(13);
  static const EdgeInsets padA15 = EdgeInsets.all(15);
  static const EdgeInsets padA16 = EdgeInsets.all(16);
  static const EdgeInsets padA20 = EdgeInsets.all(20);
  static const EdgeInsets padA24 = EdgeInsets.all(24);
  static EdgeInsets padA(val) => EdgeInsets.all(val);
  static const EdgeInsets padSV5 = EdgeInsets.symmetric(vertical: 5);
  static const EdgeInsets padSV6 = EdgeInsets.symmetric(vertical: 6);
  static const EdgeInsets padSV8 = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets padSV10 = EdgeInsets.symmetric(vertical: 10);
  static const EdgeInsets padSV12 = EdgeInsets.symmetric(vertical: 12);
  static const EdgeInsets padSV14 = EdgeInsets.symmetric(vertical: 14);
  static const EdgeInsets padSV16 = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets padSH5 = EdgeInsets.symmetric(horizontal: 5);
  static const EdgeInsets padSH10 = EdgeInsets.symmetric(horizontal: 10);
  static const EdgeInsets padSH12 = EdgeInsets.symmetric(horizontal: 12);
  static const EdgeInsets padSH16 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets padSV20 = EdgeInsets.symmetric(vertical: 20);
  static const EdgeInsets padSV24 = EdgeInsets.symmetric(vertical: 24);
  static const EdgeInsets padSH20 = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets padSH24 = EdgeInsets.symmetric(horizontal: 24);
  static const EdgeInsets padSV10H20 =
  EdgeInsets.symmetric(vertical: 10, horizontal: 20);
  static const EdgeInsets padSV16H12 =
  EdgeInsets.symmetric(vertical: 10, horizontal: 20);
  static const EdgeInsets padSV20H10 =
  EdgeInsets.symmetric(vertical: 20, horizontal: 10);
  static const EdgeInsets padSV20H16 =
  EdgeInsets.symmetric(vertical: 20, horizontal: 16);
}