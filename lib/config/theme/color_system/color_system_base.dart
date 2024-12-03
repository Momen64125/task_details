import 'package:flutter/painting.dart';

abstract class ColorSystemBase {
  Color get primaryColor;

  Color get secondaryColor;

  Color get appBarColor;

  Color get scaffoldBackgroundColor;

  Color red = const Color(0xFFD32929);

  Color green = const Color(0xFF43A033);

  Color goldenBrown = const Color(0xFFBA8600);

  Color goldenYellow = const Color(0xFFD59D1A);

  Color violetRed = const Color(0xFFC8297F);

  Color purple = const Color(0xFF9A39C8);

  Color dodgerBlue = const Color(0xFF15A0DC);

  Color get blueCardGradient;

  Color get redCardGradient;

  Color get emptyPercentIndicator;

  Color get filterSelected;

  Color get filterUnSelected;

  // all of below is Still
  Color get whiteColor;

  Color get blackColor;

  Color get strokeColor;

  Color get successColor;

  Color get warningColor;

  Color get errorColor;

  Color get divider;
}
